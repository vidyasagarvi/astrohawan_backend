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
}

export default new CategoryController();
