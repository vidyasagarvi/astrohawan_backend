import express from 'express';
import categoryController from '../controllers/categoryController.js';

const router = express.Router();

router.post('/', categoryController.addCategory);

export default router;
