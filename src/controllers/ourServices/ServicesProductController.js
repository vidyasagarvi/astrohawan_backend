import ServicesProductService from '../../services/ourServices/ServicesProductService.js';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

// Ensure uploads directory exists
const SERVICESPRODUCT_IMAGES_UPLOADS_DIR = 'storeimages/servicesproduct/';
const SERVICESPRODUCT_IMAGES_ACCESS_DIR = 'servicesproduct/';

if (!fs.existsSync(SERVICESPRODUCT_IMAGES_UPLOADS_DIR)){
    fs.mkdirSync(SERVICESPRODUCT_IMAGES_UPLOADS_DIR, { recursive: true });
}

// Configure multer storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, SERVICESPRODUCT_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
    }
});

const upload = multer({ storage: storage });

class ServicesProductController {
    async addServicesProduct(req, res) {
        upload.array('images')(req, res, async (err) => {
            if (err) {
                return res.status(500).json({ message: 'Error uploading files', error: err });
            }

            try {
                // Extract file paths
                const imageName = req.files.map(file => SERVICESPRODUCT_IMAGES_ACCESS_DIR + file.filename);
                const servicesProductData = JSON.parse(req.body.servicesProductData);
                servicesProductData.images = imageName;
                await ServicesProductService.addServicesProduct(servicesProductData);
                res.status(201).json({ status: 'success' });
            } catch (error) {
                res.status(500).json({ message: 'Error adding product', error });
            }
        });
    }



    async getServicesProducts(req, res) {
     
        const languageCode = req.query.lang || 'en';

        console.log(languageCode);

        try {
            const servicesProducts = await ServicesProductService.getAllServicesProducts(languageCode);
            res.status(200).json(servicesProducts);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching services products', error });
        }
    }


}

export default new ServicesProductController();
