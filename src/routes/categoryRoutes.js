import express from 'express';
import categoryController from '../controllers/categoryController.js';

const router = express.Router();

router.post('/', categoryController.addCategory);
router.get('/all', categoryController.getAllCategories);


export default router;
