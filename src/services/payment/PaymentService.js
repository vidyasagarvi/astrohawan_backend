import Razorpay from 'razorpay';
import crypto from 'crypto';
import connection from '../../db/Connection.js';
import { Console } from 'console';

const razorpay = new Razorpay({
  key_id: 'rzp_live_NeyDxswRdM95cX', // Replace with your Razorpay Key ID
  key_secret: 'XcIJKeEKpku673SaY0FCoEEI', // Replace with your Razorpay Key Secret
});

class PaymentService {
  // 1. Create Payment (Razorpay Order)
  async createPayment(paymentData) {
    const { amount, currency } = paymentData;

    try {
      const options = {
        amount: amount * 100, // Convert amount to smallest unit (e.g., paise for INR)
        currency: currency || 'INR',
        receipt: `receipt_${Date.now()}`,
      };

      const order = await razorpay.orders.create(options);
      return order; // Return the order details
    } catch (error) {
      throw new Error('Failed to create payment: ' + error.message);
    }
  }


  // 3. Verify Payment Signature
  async verifyPaymentSignature(paymentDetails) {
    const { razorpay_order_id, razorpay_payment_id, razorpay_signature } = paymentDetails;

    const body = razorpay_order_id + '|' + razorpay_payment_id;

    const expectedSignature = crypto
      .createHmac('sha256', razorpay.key_secret)
      .update(body)
      .digest('hex');

    if (expectedSignature === razorpay_signature) {
      return { status: true, message: 'Payment verified successfully' };
    } else {
      throw new Error('Invalid payment signature');
    }
  }


  // 2. Save Payment Details in Database
  async createOrder(orderDetails) {
    const { payment_data, user_data, cart_data, GST, SHIPPING, TotalPrice } = orderDetails;

    const custome_orderID = Math.floor(10000000 + Math.random() * 90000000);
    try {
      return new Promise((resolve, reject) => {
        connection.query(
          `INSERT INTO store_orders 
           (id, order_id, payment_id, razorpay_signature, user_id, parent_id, parent_name, gst_charge, shipping_charge, total_ammount,currency,payment_method,card_id, user_name, user_email, user_phone, pin_code, shipping_address, order_status, order_message) 
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)`,
          [
            custome_orderID, payment_data.id, '', '', user_data.userID, cart_data[0].parentId, cart_data[0].type,
            GST, SHIPPING, TotalPrice,'','','',user_data.name, user_data.email, user_data.mobile,
            user_data.pincode, user_data.shipping_address, 'pending', ''
          ],
          (err, results) => {
            if (err) return reject(err);
  
            // Insert cart data
            const cartPromises = cart_data.map(cartItems => {
              return new Promise((resolve, reject) => {
                connection.query(
                  `INSERT INTO order_details 
                   (id, product_id, parent_id, product_title, quantity, price) 
                   VALUES (?, ?, ?, ?, ?, ?)`,
                  [
                    custome_orderID, cartItems.id, cartItems.parentId, cartItems.title,
                    cartItems.quantity, cartItems.price
                  ],
                  (err) => {
                    if (err) {
                      return reject(err);
                    }
                    resolve();
                  }
                );
              });
            });
  
            Promise.all(cartPromises)
              .then(() => {
                resolve(custome_orderID);
              })
              .catch(reject);
          }
        );
      });
    } catch (error) {
      throw new Error('Failed to save payment details: ' + error.message);
    }
  }
  



  async sendOrder(paymentDetails) {
    return new Promise((resolve, reject) => {
          connection.query(
            'UPDATE store_orders SET payment_id= ?, razorpay_signature=?, order_status = ? WHERE order_id = ?',
            [paymentDetails.razorpay_payment_id, paymentDetails.razorpay_signature,'accepted',paymentDetails.razorpay_order_id],
            (err) => {
              if (err) return reject(err);
              resolve(paymentDetails.razorpay_order_id);
            }
          );
    });
  }



  getOrdersByUserId = async (userId, page = 1, itemsPerPage = 10) => {
    try {
        // Calculate offset for pagination
        const offset = (page - 1) * itemsPerPage;

        // Query to fetch orders by user ID with pagination
        const query = `
            SELECT * 
            FROM store_orders 
            WHERE user_id = ? 
            ORDER BY order_date
            LIMIT ? OFFSET ?
        `;

        const [orders] = await new Promise((resolve, reject) => {
            connection.query(query, [userId, itemsPerPage, offset], (error, results) => {
                if (error) {
                    return reject(error);
                }
                resolve([results]);
            });
        });

        if (orders.length === 0) {
            return { success: false, message: 'No orders found for this user.' };
        }

        // Query to get the total number of orders for the user (for calculating total pages)
        const countQuery = `
            SELECT COUNT(*) AS total 
            FROM store_orders 
            WHERE user_id = ?
        `;

        const [countResult] = await new Promise((resolve, reject) => {
            connection.query(countQuery, [userId], (error, results) => {
                if (error) {
                    return reject(error);
                }
                resolve([results]);
            });
        });

        const totalOrders = countResult[0].total;
        const totalPages = Math.ceil(totalOrders / itemsPerPage);

        return {
            success: true,
            currentPage: page,
            itemsPerPage,
            totalPages,
            totalOrders,
            orders,
        };
    } catch (error) {
        console.error('Error fetching orders:', error);
        return { success: false, message: 'An error occurred while fetching orders.', error };
    }
};



  async  getOrderByOrderId(orderId) {
    return new Promise((resolve, reject) => {
      // Query to fetch order details from `store_orders`
      connection.query(
        'SELECT * FROM store_orders WHERE order_id = ?',
        [orderId],
        (err, orderResult) => {
          if (err) {
            console.error('Error fetching order:', err);
            return reject({ success: false, message: 'An error occurred while fetching the order', error: err });
          }
  
          if (orderResult.length === 0) {
            return resolve({ success: false, message: 'Order not found' });
          }
  
          const order = orderResult[0];
  
          // Handle 'payment_confirm_date' format issue
          if (order.payment_confirm_date === '0000-00-00 00:00:00' || !order.payment_confirm_date) {
            order.payment_confirm_date = null; // Handle invalid date
          }
  
          // Query to fetch product details from `order_details`
          connection.query(
            'SELECT * FROM order_details WHERE id = ?',
            [order.id],
            (err, orderDetails) => {
              if (err) {
                console.error('Error fetching order details:', err);
                return reject({ success: false, message: 'An error occurred while fetching the order details', error: err });
              }
  
              order.products = orderDetails;
              // Return the combined data
              return resolve({ success: true, orders: order });
            }
          );
        }
      );
    });
  }
  
  
  // 5. Get All Payments
  async getAllPayments() {
    try {
      const [rows] = await connection.promise().query(`SELECT * FROM payments`);
      return rows;
    } catch (error) {
      throw new Error('Failed to fetch all payments: ' + error.message);
    }
  }

  async webhookConfirm(webhookDetails) {


    return new Promise((resolve, reject) => {
      const currentTimestamp = new Date();
          connection.query(
            'UPDATE store_orders SET currency= ?, payment_method=?, card_id = ?, order_status=?, payment_confirm_date=? WHERE order_id = ?',
            [webhookDetails.payload.payment.entity.currency, webhookDetails.payload.payment.entity.method,webhookDetails.payload.payment.entity.card_id,webhookDetails.payload.payment.entity.status,currentTimestamp, webhookDetails.payload.payment.entity.order_id],
            (err) => {
              if (err) return reject(err);
              resolve(webhookDetails.payload.payment.entity.order_id);
            }
          );
    });
  }


}

export default new PaymentService();
