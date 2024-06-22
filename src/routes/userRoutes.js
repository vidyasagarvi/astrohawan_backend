import { Router } from 'express';
import userController from '../controllers/UserController.js';

const router = Router();

router.post('/signup', userController.signup);
router.post('/verify-otp', userController.verifyOTP);
router.post('/login', userController.login);
router.get('/details', userController.getUserDetails);


export default router;
