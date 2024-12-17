import { Router } from 'express';
import QueriesController from '../controllers/Queries.js';

const router = Router();
router.post('/queries', QueriesController.add);
export default router;
