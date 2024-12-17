import MandirService from '../../services/mandir/MandirService.js';
import multer from 'multer';
import path from 'path';

// Ensure uploads directory exists
const MANDIR_IMAGES_UPLOADS_DIR = 'storeimages/mandir/';
const MANDIR_IMAGES_ACCESS_DIR = 'mandir/';

// Configure multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, MANDIR_IMAGES_UPLOADS_DIR); // Save files to 'uploads' directory
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); // Save file with a unique name
  }
});

const upload = multer({ storage: storage });

class MandirController {

    async addMandir(req, res) {

        upload.array('images')(req, res, async (err) => {
          if (err) {
            return res.status(500).json({ message: 'Error uploading files', error: err });
          }
    
          try {
            // Extract file paths
    
            const imageName = req.files.map(file => MANDIR_IMAGES_ACCESS_DIR+file.filename);
            const mandirData = JSON.parse(req.body.mandirData);
           
            mandirData.images = imageName;
   
            const product = await MandirService.addMandir(mandirData);
    
            res.status(201).json({ status: 'success'});
          } catch (error) {
            res.status(500).json({ message: 'Error adding product', error });
          }
        });
      }


      async getMandirs(req, res) {
        const languageCode = req.query.lang || 'en';

        try {
            const mandirs = await MandirService.getAllMandirs(languageCode);
            res.status(200).json(mandirs);
        } catch (error) {
            res.status(500).json({ message: 'Error fetching mandirs', error });
        }
    }


    async getMandirById(req, res) {
      const { mandirId, language } = req.params;

      try {
          const mandir = await MandirService.getMandirById(mandirId, language);
          if (!mandir) {
              return res.status(404).json({ message: 'Mandir not found' });
          }
          res.status(200).json(mandir);
      } catch (error) {
          res.status(500).json({ message: 'Error fetching mandir', error });
      }
  }


    }

export default new MandirController();
