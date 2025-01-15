import nodemailer from 'nodemailer';

class SendOrderMail {

    async SendorderMail(order) {

        const transporter = nodemailer.createTransport({
            host: 'smtpout.secureserver.net',
            port: 465,
            secure: true,
            auth: {
                user: 'info@thesatim.com',
                pass: 'Ayansh@9899'
            }
        });

        const mailOptions1 = {
            from: '"Santim Order" <info@thesatim.com>',
            to: `${order.orders.user_email}`,
            subject: 'Your order from Santim',
            html: `
 <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: auto; padding: 0; border-radius: 10px; border: 1px solid #ddd; background-color: #ffffff;">
  <!-- Header -->
  <div style="background-color: #5B1D06; padding: 10px; border-radius: 10px 10px 0 0;">
    <img src="http://www.thesatim.com/static/media/site_logo.132f8b7af655f73b8021.png" alt="Santim Logo" style="width: 70px; height: 70px; display: block;">
  </div>

<!-- Content -->
<div style="padding: 20px; font-size: 14px; line-height: 1.6; color: #333;">
<h3 style="color: #5B1D06; margin-top: 0;">Thank You for Your Order!</h3>
<p>Dear <b>${order.orders.user_name}</b>,</p>
<p>Your order has been successfully placed. Here are the details of your purchase:</p>

<!-- Order Summary -->
<div style="margin: 20px 0; border: 1px solid #ddd; border-radius: 5px; padding: 10px; background-color: #f9f9f9;">
  <p><strong>Order ID:</strong> ${order.orders.id}</p>
  <p><strong>Order Date:</strong> ${order.orders.order_date}</p>
  <p><strong>Delivery Address::</strong> ${order.orders.shipping_address}</p>
  <p><strong>Total Amount:</strong> ₹${order.orders.total_ammount} (including GST ₹${order.orders.gst_charge} and shipping ₹${order.orders.shipping_charge})</p>
</div>

<!-- Product Details -->
<h4 style="color: #5B1D06; margin-bottom: 10px;">Products:</h4>
<table style="width: 100%; border-collapse: collapse; font-size: 14px;">
  <thead>
    <tr style="background-color: #f5f5f5; text-align: left;">
      <th style="padding: 8px; border: 1px solid #ddd;">Product</th>
      <th style="padding: 8px; border: 1px solid #ddd;">Quantity</th>
      <th style="padding: 8px; border: 1px solid #ddd;">Price</th>
    </tr>
  </thead>
  <tbody>
    ${order.orders.products.map((item) => `
    <tr>
      <td style="padding: 8px; border: 1px solid #ddd;">${item.product_title}</td>
      <td style="padding: 8px; border: 1px solid #ddd;">${item.quantity}</td>
      <td style="padding: 8px; border: 1px solid #ddd;">₹${item.price}</td>
    </tr>
    `
            )
                    .join("")}
  </tbody>
</table>

<p style="margin-top: 20px;">Your order will be delivered to:</p>
<p style="font-weight: bold;">${order.orders.shipping_address}, ${order.orders.pin_code}</p>
<p>If you have any questions, feel free to contact us at <a href="mailto:info@thesatim.com" style="color: #0066cc;">info@thesatim.com</a>.</p>
</div>

<!-- Footer -->
<div style="background-color: #212121; padding: 15px; text-align: center; border-radius: 0 0 10px 10px; color: #d4e0e1; font-size: 12px;">
<p style="margin: 0;">Plot no 5, Sec -2A PNB Road, Vaishali Ghaziabad UP 201010</p>
<p style="margin: 5px 0;">&#x2709; <a href="mailto:info@thesatim.com" style="color: #d4e0e1; text-decoration: none;">info@thesatim.com</a> | &#x260E; +91 70425 55040</p>
<p style="margin: 0; font-size: 11px;">&copy; 2024 Santim. All rights reserved.</p>
</div>
</div>
    `
        };


        const mailOptions2 = {
            from: '"Santim Order" <info@thesatim.com>',
            to: "thesatims@gmail.com",
            subject: `Your order from ${order.orders.user_name}`,
            html: `
       <div style="font-family: Arial, sans-serif; color: #333; max-width: 600px; margin: auto; padding: 0; border-radius: 10px; border: 1px solid #ddd; background-color: #ffffff;">
  <!-- Header -->
  <div style="background-color: #5B1D06; padding: 10px; border-radius: 10px 10px 0 0;">
    <img src="http://www.thesatim.com/static/media/site_logo.132f8b7af655f73b8021.png" alt="Santim Logo" style="width: 70px; height: 70px; display: block;">
  </div>

<!-- Content -->

 <div style="padding: 20px; font-size: 14px; line-height: 1.6;">
    <h3 style="color: #333;">Order Details:</h3>
    <p><strong>Order ID:</strong> ${order.orders.id}</p>
    <p><strong>User Name:</strong> ${order.orders.user_name}</p>
    <p><strong>User Email:</strong> ${order.orders.user_email}</p>
    <p><strong>User Phone:</strong> ${order.orders.user_phone}</p>
    <p><strong>Shipping Address:</strong> ${order.orders.shipping_address}</p>
    <p><strong>Total Amount:</strong> ₹${order.orders.total_ammount}</p>
    <p><strong>Order Date:</strong> ${order.orders.order_date}</p>
    <p><strong>Order Status:</strong> ${order.orders.order_status}</p>

    <h3 style="color: #333;">Product Details:</h3>
    <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
      <thead>
        <tr>
          <th style="text-align: left; padding: 10px; background-color: #f4f4f4; border: 1px solid #ddd;">Product</th>
          <th style="text-align: left; padding: 10px; background-color: #f4f4f4; border: 1px solid #ddd;">Quantity</th>
          <th style="text-align: left; padding: 10px; background-color: #f4f4f4; border: 1px solid #ddd;">Price</th>
        </tr>
      </thead>
      <tbody>

    ${order.orders.products.map((item) => `
    <tr>
      <td style="padding: 10px; border: 1px solid #ddd;">${item.product_title}</td>
      <td style="padding: 10px; border: 1px solid #ddd;">${item.quantity}</td>
      <td style="padding: 10px; border: 1px solid #ddd;">₹${item.price}</td>
    </tr>
    `
            )
                    .join("")}
      </tbody>
    </table>

    <h3 style="color: #333;">Additional Information:</h3>
    <p><strong>GST Charge:</strong> ₹${order.orders.gst_charge}</p>
    <p><strong>Shipping Charge:</strong> ₹${order.orders.shipping_charge}</p>

    <p>If you have any questions, please feel free to contact us.</p>
  </div>

<!-- Footer -->
<div style="background-color: #212121; padding: 15px; text-align: center; border-radius: 0 0 10px 10px; color: #d4e0e1; font-size: 12px;">
<p style="margin: 0;">Plot no 5, Sec -2A PNB Road, Vaishali Ghaziabad UP 201010</p>
<p style="margin: 5px 0;">&#x2709; <a href="mailto:info@thesatim.com" style="color: #d4e0e1; text-decoration: none;">info@thesatim.com</a> | &#x260E; +91 70425 55040</p>
<p style="margin: 0; font-size: 11px;">&copy; 2024 Santim. All rights reserved.</p>
</div>
</div>
    `
        };

        try {
            // Sending both emails concurrently using Promise.all
            const [info1, info2] = await Promise.all([
              transporter.sendMail(mailOptions1), // Sending email to user
              transporter.sendMail(mailOptions2)  // Sending email to admin
            ]);
        
            console.log('User email sent: ' + info1.response);
            console.log('Admin email sent: ' + info2.response);
        
          } catch (error) {
            console.error('Error sending emails:', error);
          }


    }
}
export default new SendOrderMail();
