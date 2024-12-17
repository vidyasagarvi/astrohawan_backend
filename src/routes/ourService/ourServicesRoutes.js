import express from 'express';
import OurServicesController from '../../controllers/ourServices/OurServicesController.js';
import ServicesProductController from '../../controllers/ourServices/ServicesProductController.js';


const router = express.Router();


router.post('/add', OurServicesController.addServices);
router.get('/getall', OurServicesController.getServices);
router.get('/get/:serviceId/:language', OurServicesController.getServicesById);
router.post('/product', ServicesProductController.addServicesProduct);
router.get('/product', ServicesProductController.getServicesProducts);


export default router;
