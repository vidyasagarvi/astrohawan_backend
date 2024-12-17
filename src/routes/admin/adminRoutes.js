import { Router } from 'express';
import adminController from '../../controllers/admin/AdminController.js';
import PujaStoreAdmin from '../../controllers/admin/PujaStoreAdmin.js';

const router = Router();

router.post('/login', adminController.login);
router.get('/pujastore/:id', PujaStoreAdmin.getPujaStoreProductById);
router.put('/pujastore/edit/:id', PujaStoreAdmin.updatePujaStoreProduct);

export default router;
