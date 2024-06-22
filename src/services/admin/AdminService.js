import connection from '../../db/Connection.js';

class AdminService {

  loginAdmin(email, password) {

    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM admin WHERE email = ?',
        [email],
        async (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject(new Error('User not found'));

          const admin = results[0];
          let isPasswordValid = false;
   
          if(password==admin.password){
             isPasswordValid = true;
          }

          if (!isPasswordValid) return reject(new Error('Invalid password'));

          resolve(admin.id);
        }
      );
    });
  }


}

export default new AdminService();
