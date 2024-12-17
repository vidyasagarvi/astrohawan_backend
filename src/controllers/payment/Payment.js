import PaymentService from '../../services/payment/PaymentService.js';
import SendOrderMail from '../../utility/SendOrderMail.js';

class Payment {

  async createPayment(req, res) {
    try {
      const admin = await PaymentService.createPayment(req.body);
      res.status(200).json({ status: 'success', message : 'payment successful', admin });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error payment in', error });
    }
  }


  async verifyPaymentSignature(req, res) {
    try {
      const admin = await PaymentService.verifyPaymentSignature(req.body);
      res.status(200).json({ status: 'success', message : 'payment successful', admin });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error payment in', error });
    }
  }


  async createOrder(req, res) {
    try {

      const order = await PaymentService.createOrder(req.body);
      res.status(200).json({ 
        status: 'success', 
        message: 'Order created successfully', 
        order // Returning the created order
      });

    } catch (error) {
      res.status(500).json({ 
        status: 'failed', 
        message: 'Error in creating order', 
        error: error.message // Returning a meaningful error message
      });
    }
  }



  async sendOrder(req, res) {
    try {
          const order = await PaymentService.sendOrder(req.body);
          res.status(200).json({ 
          status: 'success', 
          message: 'Order send successfully', 
          order // Returning the created order
      });

       const Orders =  await PaymentService.getOrderByOrderId(order);
       const mailResponse =  await SendOrderMail.SendorderMail(Orders);
      } catch (error) {
        res.status(500).json({ 
        status: 'failed', 
        message: 'Error in send order', 
        error: error.message // Returning a meaningful error message
      });
    }
  }

  

  async getOrdersByUserId(req, res) {
    const { id } = req.params;
    const { page } = req.params;
    const itemsPerPage = 2; // Example: 5 orders per page
    try {
        const product = await PaymentService.getOrdersByUserId(id, page, itemsPerPage);
        if (!product) {
            return res.status(404).json({ message: 'Order not found' });
        }
        res.status(200).json(product);
    } catch (error) {
        console.error('Error fetching product:', error);
        res.status(500).json({ message: 'Error fetching Order', error });
    }
}



async getOrderByOrderId(req, res) {
  const { id } = req.params;
  try {
      const product = await PaymentService.getOrderByOrderId(id);
      if (!product) {
          return res.status(404).json({ message: 'Order not found' });
      }
      res.status(200).json(product);
  } catch (error) {
      console.error('Error fetching product:', error);
      res.status(500).json({ message: 'Error fetching Order', error });
  }
}



}

export default new Payment();
