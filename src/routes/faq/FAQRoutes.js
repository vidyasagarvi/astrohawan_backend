import express from 'express';
import FAQController from '../../controllers/faq/FAQController.js';

const router = express.Router();

router.post('/add', FAQController.addFAQ);
router.get('/get/:id/:languageCode', FAQController.getFAQ);
router.get('/gets/:languageCode', FAQController.getAllFAQsByLanguage);

export default router;
