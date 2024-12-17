import PujaStoreService from '../../services/admin/PujaStoreAdmin.js';

class PujaStoreAdmin {

    async getPujaStoreProductById(req, res) {
        const { id } = req.params;

        try {
            const product = await PujaStoreService.getPujaStoreProductByIdWithAllTranslations(id);
            if (!product) {
                return res.status(404).json({ message: 'Product not found' });
            }
            res.status(200).json(product);
        } catch (error) {
            console.error('Error fetching product:', error);
            res.status(500).json({ message: 'Error fetching product', error });
        }
    }


    async updatePujaStoreProduct(req, res) {
        const { id } = req.params;
        const productData = req.body;

        try {
            await PujaStoreService.updatePujaStoreProduct(id, productData);
            res.status(200).json({ message: 'Product updated successfully' });
        } catch (error) {
            console.error('Error updating product:', error);
            res.status(500).json({ message: 'Error updating product', error });
        }
    }

}

export default new PujaStoreAdmin();