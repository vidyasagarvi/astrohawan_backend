import categoryService from '../services/categoryService.js';

class CategoryController {
    async addCategory(req, res) {
        try {
          
            const category = await categoryService.addCategory(req.body);
            res.status(201).json(category);
        } catch (error) {
            res.status(500).json({ message: 'Error adding category', error });
        }
    }


    async getAllCategories(req, res) {
        const languageCode = req.query.lang || 'en'; // Default to 'en' if no language code is provided

        try {
            const categories = await categoryService.getAllCategories(languageCode);
            res.status(200).json(categories);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching categories', error: error.message });
        }
    }


}

export default new CategoryController();
