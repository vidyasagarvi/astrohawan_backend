import { Router } from 'express';
import userController from '../controllers/SettingController.js';

const router = Router();
router.get('/gets', userController.getSettings);
export default router;
