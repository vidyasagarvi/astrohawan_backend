import FAQService from '../../services/faq/FAQService.js';

class FAQController {
    async addFAQ(req, res) {
        try {
            const faqData = req.body;
            await FAQService.addFAQ(faqData);
            res.status(201).json({ message: 'FAQ added successfully' });
        } catch (error) {
            res.status(500).json({ message: 'Error adding FAQ', error });
        }
    }

    async getFAQ(req, res) {
        try {
            const { id, languageCode } = req.params;
            const faq = await FAQService.getFAQ(id, languageCode);
            res.status(200).json(faq);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching FAQ', error });
        }
    }


    async getAllFAQsByLanguage(req, res) {
        try {
            const { languageCode } = req.params;
            const faqs = await FAQService.getAllFAQsByLanguage(languageCode);
            res.status(200).json(faqs);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching FAQs', error });
        }
    }



}

export default new FAQController();
