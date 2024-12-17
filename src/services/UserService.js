import connection from '../db/Connection.js';
import User from '../models/User.js';
import OTP from '../models/OTP.js';
import bcrypt from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';

class UserService {
  async addUser(userData) {

    const userId = uuidv4();
    const hashedPassword = await bcrypt.hash(userData.password, 10);
    const user = new User(userId, userData.mobile_no, userData.email, hashedPassword, userData.name, userData.shipping_address, userData.pincode);

    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO users (id, mobile_no, email, password, name, shipping_address, pincode) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [user.id, user.mobile_no, user.email, user.password, user.name, user.shipping_address,user.pincode],
        (err) => {
          if (err) return reject(err);
          resolve(user);
        }
      );
    });
  }

  generateOTP(user_id) {
    const otpCode = Math.floor(10000 + Math.random() * 90000).toString();
    const otpId = uuidv4();
    const expiresAt = new Date(Date.now() + 10 * 60000); // OTP expires in 10 minutes

    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO otps (id, user_id, otp_code, expires_at) VALUES (?, ?, ?, ?)',
        [otpId, user_id, otpCode, expiresAt],
        (err) => {
          if (err) return reject(err);
          resolve(new OTP(otpId, user_id, otpCode));
        }
      );
    });
  }


  verifyOTP(user_id, otp_code) {
    return new Promise((resolve, reject) => {

      connection.query(
        'SELECT * FROM otps WHERE otp_code = ? AND otp_code = ? AND expires_at > NOW()',
        [otp_code, otp_code],
        (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject(new Error('Invalid or expired OTP'));
          connection.query(
            'UPDATE users SET is_verified = TRUE WHERE id = ?',
            [results[0].user_id],
            (err) => {
              if (err) return reject(err);
              resolve(true);
            }
          );
        }
      );
    });
  }


  loginUser(email, password) {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM users WHERE email = ?',
        [email],
        async (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject({ err: "not_found" });
          const user = results[0];
         const isPasswordValid = await bcrypt.compare(password, user.password);
          if (!isPasswordValid) return reject({ err: "invalid_password" });
          if (!user.is_verified) return reject({ err: "user_not_verified" });
          resolve(user);
        }
      );
    });
  }


  forgotPassword(email){
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT id , is_verified FROM users WHERE email = ?',
        [email],
        async (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject({ err: "not_found" });
          const user = results[0];
          if (!user.is_verified) return reject({ err: "user_not_verified" });
          const newpassword = Math.floor(10000 + Math.random() * 90000).toString();
          const hashedPassword = await bcrypt.hash(newpassword, 10);
          await connection.promise().query(
            'UPDATE users SET password = ? WHERE id = ?',
            [hashedPassword, userData.token]
          );
          resolve({ message: "Password updated successfully" });

          resolve(user);
        }
      );
    });

  }



  updatePassword(userData) {

    return new Promise(async (resolve, reject) => {
      try {
        // First, fetch the user to check if it exists and validate the current password
        const [user] = await connection.promise().query(
          'SELECT * FROM users WHERE id = ?',
          [userData.token]
        );
  
        if (!user) return reject({ err: "not_found" });
       
        // Verify current password
        const isPasswordValid = await bcrypt.compare(userData.password, user[0].password);
        if (!isPasswordValid) return reject({ err: "invalid_password" });
        // Hash the new password
        const hashedPassword = await bcrypt.hash(userData.new_password, 10);
        // Update password in the database
        await connection.promise().query(
          'UPDATE users SET password = ? WHERE id = ?',
          [hashedPassword, userData.token]
        );
        resolve({ message: "Password updated successfully" });
      } catch (err) {
        reject(err);
      }
    });
  }


  getUserById(userId) {
    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM users WHERE id = ?',
        [userId],
        (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject(new Error('User not found'));
          const userData = results[0];
          const user = new User(userData.id, userData.mobile_no, userData.email, userData.password, userData.name, userData.shipping_address, userData.pincode, userData.is_verified);
          resolve(user);
        }
      );
    });
  }


}

export default new UserService();
