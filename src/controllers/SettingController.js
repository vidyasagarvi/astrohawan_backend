import SettingServices from '../services/SettingServices.js';


class SettingController {

  async getSettings(req, res) {
    try {
      const settings = await SettingServices.getSettings();
      res.status(200).json({settings});
    } catch (error) {
      res.status(500).json({ message: 'Error retrieving settins details', error: error.message });
    }
  }

}

export default new SettingController();
