// src/controllers/mandir/MandirProductController.js
import HelpsProductService from '../../services/helpsNeedy/HelpsProductService.js';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

// Ensure uploads directory exists
const HELPSPRODUCT_IMAGES_UPLOADS_DIR = 'storeimages/helpsproduct/';
const HELPSPRODUCT_IMAGES_ACCESS_DIR = 'helpsproduct/';

if (!fs.existsSync(HELPSPRODUCT_IMAGES_UPLOADS_DIR)){
    fs.mkdirSync(HELPSPRODUCT_IMAGES_UPLOADS_DIR, { recursive: true });
}

// Configure multer storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, HELPSPRODUCT_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
    }
});

const upload = multer({ storage: storage });

class HelpsProductController {
    async addHelpsNeedyProduct(req, res) {
        upload.array('images')(req, res, async (err) => {
            if (err) {
                return res.status(500).json({ message: 'Error uploading files', error: err });
            }

            try {
                // Extract file paths
                const imageName = req.files.map(file => HELPSPRODUCT_IMAGES_ACCESS_DIR + file.filename);
                const helpsProductData = JSON.parse(req.body.helpsProductData);
                helpsProductData.images = imageName;
                await HelpsProductService.addHelpsNeedyProduct(helpsProductData);
                res.status(201).json({ status: 'success' });
            } catch (error) {
                res.status(500).json({ message: 'Error adding product', error });
            }
        });
    }



    async getHelpsNeedyProducts(req, res) {
     
        const languageCode = req.query.lang || 'en';

        console.log(languageCode);

        try {
            const helpsProducts = await HelpsProductService.getHelpsNeedyProducts(languageCode);
            res.status(200).json(helpsProducts);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching products', error });
        }
    }


}

export default new HelpsProductController();
