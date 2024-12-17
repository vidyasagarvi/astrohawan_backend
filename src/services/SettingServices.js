import connection from '../db/Connection.js';

class SettingServices {

    getSettings() {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM tbl_settings',
        (err, results) => {
          if (err) return reject(err);
          resolve(results);
        }
      );
    });
  }


}

export default new SettingServices();
