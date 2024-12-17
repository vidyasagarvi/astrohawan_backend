import PujaStoreService from '../services/PujaStoreService.js';
import multer from 'multer';
import path from 'path';

// Ensure uploads directory exists
const PUJASTORE_IMAGES_UPLOADS_DIR = 'storeimages/pujastore/';
const PUJASTORE_IMAGES_ACCESS_DIR = 'pujastore/';

// Configure multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, PUJASTORE_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
  }
});

const upload = multer({ storage: storage });

class PujastoreController {
  async addpujaStoreProduct(req, res) {

    upload.array('images')(req, res, async (err) => {
      if (err) {
        return res.status(500).json({ message: 'Error uploading files', error: err });
      }

      try {
        // Extract file paths

        const imageName = req.files.map(file => PUJASTORE_IMAGES_ACCESS_DIR+file.filename);
        const productData = JSON.parse(req.body.productData);
       
        productData.images = imageName;

        const product = await PujaStoreService.addpujaStoreProduct(productData);

        res.status(201).json({ status: 'success'});
      } catch (error) {
        res.status(500).json({ message: 'Error adding product', error });
      }
    });
  }

  async getAllpujaStoreProduct(req, res) {
    try {

      const languageCode = req.query.lang || 'en';
      const products = await PujaStoreService.getAllpujaStoreProduct(languageCode);
      res.status(200).json(products);
    } catch (error) {
      res.status(500).json({ message: 'Error fetching products', error });
    }
  }



  async getAllpujaStoreProducts(req, res) {
    const languageCode = req.query.lang || 'en';
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const categoryId = req.query.categoryId || null;
    const searchQuery = req.query.search || null;

    console.log(`Fetching products - Lang: ${languageCode}, Page: ${page}, Limit: ${limit}, Category: ${categoryId}, Search: ${searchQuery}`);

    try {
        const result = await PujaStoreService.getAllpujaStoreProducts(languageCode, page, limit, categoryId, searchQuery);
        const { total, groupedProducts } = result;
        res.status(200).json({
            total,
            page,
            limit,
            pages: Math.ceil(total / limit),
            data: groupedProducts
        });
    } catch (error) {
        console.error('Error fetching products:', error);
        res.status(500).json({ message: 'Error fetching products', error });
    }
}




  async getpujaStoreProductById(req, res) {
    try {
      const languageCode = req.query.lang || 'en';
      const product = await PujaStoreService.getpujaStoreProductById(req.params.id, languageCode);
      if (product) {
        res.status(200).json(product);
      } else {
        res.status(404).json({ message: 'Product not found' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error fetching product', error });
    }
  }

  async deletepujaStoreProduct(req, res) {
    try {
      const isDeleted = await PujaStoreService.deletepujaStoreProduct(req.params.id);
      if (isDeleted) {
        res.status(204).end();
      } else {
        res.status(404).json({ message: 'Product not found' });
      }
    } catch (error) {
      res.status(500).json({ message: 'Error deleting product', error });
    }
  }

}

export default new PujastoreController();