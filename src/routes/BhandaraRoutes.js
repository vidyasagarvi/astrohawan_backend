import express from 'express';
import BhandaraController from '../controllers/BhandaraController.js';
const router = express.Router();

router.post('/', BhandaraController.addBhandara);


export default router;

