import express from 'express';
import Payment from '../../controllers/payment/Payment.js';

const router = express.Router();

router.post('/create', Payment.createPayment);
router.post('/verify', Payment.verifyPaymentSignature);
router.post('/create-order', Payment.createOrder);
router.post('/send-order', Payment.sendOrder);
router.get('/getuser-order/:id/:page', Payment.getOrdersByUserId);
router.get('/getorder-id/:id/', Payment.getOrderByOrderId);

export default router;