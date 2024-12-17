import express from 'express';
import HelpsController from '../../controllers/helpsNeedy/HelpsController.js';
import HelpsProductController from '../../controllers/helpsNeedy/HelpsProductController.js';

const router = express.Router();

router.post('/add', HelpsController.addHelpsNeedy);
router.get('/getall', HelpsController.getHelpsNeedy);
router.get('/get/:helpsId/:language', HelpsController.getHelpsNeedyById);
router.post('/product', HelpsProductController.addHelpsNeedyProduct);
router.get('/product', HelpsProductController.getHelpsNeedyProducts);

export default router;
