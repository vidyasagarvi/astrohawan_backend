import connection from '../../db/Connection.js';
import { v4 as uuidv4 } from 'uuid';

class FAQService {
    async addFAQ(faqData) {
        const id = uuidv4();
        const { translations } = faqData;

        try {
            await connection.promise().beginTransaction();

            // Insert FAQ
            await connection.promise().query('INSERT INTO faqs (id) VALUES (?)', [id]);

            // Insert translations
            const translationPromises = translations.map(translation => {
                return connection.promise().query(
                    `INSERT INTO faq_translations (id, faq_id, language_code, question, answer)
                     VALUES (UUID(), ?, ?, ?, ?)`,
                    [id, translation.language_code, translation.question, translation.answer]
                );
            });

            // Execute all queries
            await Promise.all(translationPromises);

            // Commit transaction
            await connection.promise().commit();

            return true; // or whatever success response you need
        } catch (error) {
            // Rollback on error
            await connection.promise().rollback();
            throw error;
        }
    }

    async getFAQ(id, languageCode) {
        const [faqTranslations] = await connection.promise().query(
            `SELECT question, answer
             FROM faq_translations
             WHERE faq_id = ? AND language_code = ?`,
            [id, languageCode]
        );
        return faqTranslations;
    }

    async getAllFAQsByLanguage(languageCode) {
        const [faqs] = await connection.promise().query(
            `SELECT f.id as faq_id, ft.language_code, ft.question, ft.answer
             FROM faqs f
             JOIN faq_translations ft ON f.id = ft.faq_id
             WHERE ft.language_code = ? AND f.status=1`,
            [languageCode]
        );
        return faqs;
    }



}







export default new FAQService();
