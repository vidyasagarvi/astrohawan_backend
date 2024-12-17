import express from 'express';
import MandirController from '../../controllers/mandir/MandirController.js';
import MandirProductController from '../../controllers/mandir/MandirProductController.js';

const router = express.Router();

router.post('/add', MandirController.addMandir);
router.get('/getall', MandirController.getMandirs);
router.get('/get/:mandirId/:language', MandirController.getMandirById);
router.post('/product', MandirProductController.addMandirProduct);
router.get('/product', MandirProductController.getMandirProducts);

export default router;
