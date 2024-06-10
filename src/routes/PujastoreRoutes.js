import express from 'express';
import PujastoreController from '../controllers/PujastoreController.js';
// Use the PujastoreController
const router = express.Router();

router.post('/', PujastoreController.addpujaStoreProduct);
router.get('/', PujastoreController.getAllpujaStoreProduct);
router.get('/:id', PujastoreController.getpujaStoreProductById);
router.delete('/:id', PujastoreController.deletepujaStoreProduct);


export default router;

