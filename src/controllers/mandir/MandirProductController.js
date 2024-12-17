// src/controllers/mandir/MandirProductController.js
import MandirProductService from '../../services/mandir/MandirProductService.js';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

// Ensure uploads directory exists
const MANDIRPRODUCT_IMAGES_UPLOADS_DIR = 'storeimages/mandirproduct/';
const MANDIRPRODUCT_IMAGES_ACCESS_DIR = 'mandirproduct/';

if (!fs.existsSync(MANDIRPRODUCT_IMAGES_UPLOADS_DIR)){
    fs.mkdirSync(MANDIRPRODUCT_IMAGES_UPLOADS_DIR, { recursive: true });
}

// Configure multer storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, MANDIRPRODUCT_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
    }
});

const upload = multer({ storage: storage });

class MandirProductController {
    async addMandirProduct(req, res) {
        upload.array('images')(req, res, async (err) => {
            if (err) {
                return res.status(500).json({ message: 'Error uploading files', error: err });
            }

            try {
                // Extract file paths
                const imageName = req.files.map(file => MANDIRPRODUCT_IMAGES_ACCESS_DIR + file.filename);
                const mandirProductData = JSON.parse(req.body.mandirProductData);
                mandirProductData.images = imageName;
                await MandirProductService.addMandirProduct(mandirProductData);
                res.status(201).json({ status: 'success' });
            } catch (error) {
                res.status(500).json({ message: 'Error adding product', error });
            }
        });
    }



    async getMandirProducts(req, res) {
     
        const languageCode = req.query.lang || 'en';

        console.log(languageCode);

        try {
            const mandirProducts = await MandirProductService.getAllMandirProducts(languageCode);
            res.status(200).json(mandirProducts);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching mandir products', error });
        }
    }


}

export default new MandirProductController();
