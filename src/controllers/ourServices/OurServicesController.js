import ServicesService from '../../services/ourServices/OurServicesService.js';
import multer from 'multer';
import path from 'path';

// Ensure uploads directory exists
const SERVICES_IMAGES_UPLOADS_DIR = 'storeimages/ourservices/';
const SERVICES_IMAGES_ACCESS_DIR = 'ourservices/';

// Configure multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, SERVICES_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
  }
});

const upload = multer({ storage: storage });

class ourServicesController {

    async addServices(req, res) {

        upload.array('images')(req, res, async (err) => {
          if (err) {
            return res.status(500).json({ message: 'Error uploading files', error: err });
          }
    
          try {
            // Extract file paths
    
            const imageName = req.files.map(file => SERVICES_IMAGES_ACCESS_DIR+file.filename);
            const servicesData = JSON.parse(req.body.servicesData);
           
            servicesData.images = imageName;
   
            const product = await ServicesService.addServices(servicesData);
    
            res.status(201).json({ status: 'success'});
          } catch (error) {
            res.status(500).json({ message: 'Error adding Services', error });
          }
        });
      }


      async getServices(req, res) {
        const languageCode = req.query.lang || 'en';

        try {
            const mandirs = await ServicesService.getAllService(languageCode);
            res.status(200).json(mandirs);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching Services', error });
        }
    }


    async getServicesById(req, res) {
      const { serviceId, language } = req.params;

      try {
          const service = await ServicesService.getServicesById(serviceId, language);
          if (!service) {
              return res.status(404).json({ message: 'Services not found' });
          }
          res.status(200).json(service);
      } catch (error) {
          res.status(500).json({ message: 'Error fetching Services', error });
      }
  }


    }

export default new ourServicesController();
