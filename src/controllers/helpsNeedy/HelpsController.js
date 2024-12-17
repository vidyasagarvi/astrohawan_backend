import HelpsService from '../../services/helpsNeedy/HelpsService.js';
import multer from 'multer';
import path from 'path';

// Ensure uploads directory exists
const HELPS_IMAGES_UPLOADS_DIR = 'storeimages/helpsneedy/';
const HELPS_IMAGES_ACCESS_DIR = 'helpsneedy/';

// Configure multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, HELPS_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
  }
});

const upload = multer({ storage: storage });

class HelpsController {

    async addHelpsNeedy(req, res) {

        upload.array('images')(req, res, async (err) => {
          if (err) {
            return res.status(500).json({ message: 'Error uploading files', error: err });
          }
    
          try {
            // Extract file paths
    
            const imageName = req.files.map(file => HELPS_IMAGES_ACCESS_DIR+file.filename);
            const helpsData = JSON.parse(req.body.helpsData);
           
            helpsData.images = imageName;

            const product = await HelpsService.addHelpsNeedy(helpsData);
    
            res.status(201).json({ status: 'success'});
          } catch (error) {
            res.status(500).json({ message: 'Error adding Helps to needy person', error });
          }
        });
      }

  // Gell All Hepls to needy persone

      async getHelpsNeedy(req, res) {
        const languageCode = req.query.lang || 'en';

        try {
            const helps = await HelpsService.getAllHelpsNeedy(languageCode);
            res.status(200).json(helps);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching Needy person', error });
        }
    }


    async getHelpsNeedyById(req, res) {
      const { helpsId, language } = req.params;

      try {
          const mandir = await HelpsService.getHelpsNeedyById(helpsId, language);
          if (!mandir) {
              return res.status(404).json({ message: 'Needy person not found' });
          }
          res.status(200).json(mandir);
      } catch (error) {
          res.status(500).json({ message: 'Error fetching Needy person', error });
      }
  }


    }

export default new HelpsController();
