import connection from '../db/Connection.js';
import User from '../models/User.js';
import OTP from '../models/OTP.js';
import bcrypt from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';

class UserService {
  async addUser(userData) {
    const userId = uuidv4();
    const hashedPassword = await bcrypt.hash(userData.password, 10);
    const user = new User(userId, userData.mobile_no, userData.email, hashedPassword, userData.name, userData.shipping_address);

    return new Promise((resolve, reject) => {
      connection.query(
        'INSERT INTO users (id, mobile_no, email, password, name, shipping_address) VALUES (?, ?, ?, ?, ?, ?)',
        [user.id, user.mobile_no, user.email, user.password, user.name, user.shipping_address],
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
          resolve(new OTP(otpId, user_id, otpCode, expiresAt));
        }
      );
    });
  }

  verifyOTP(user_id, otp_code) {

    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM otps WHERE user_id = ? AND otp_code = ? AND expires_at > NOW()',
        [user_id, otp_code],
        (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject(new Error('Invalid or expired OTP'));

          connection.query(
            'UPDATE users SET is_verified = TRUE WHERE id = ?',
            [user_id],
            (err) => {
              if (err) return reject(err);
              resolve(true);
            }
          );
        }
      );
    });
  }

  loginUser(mobile_no, password) {

    return new Promise((resolve, reject) => {
      connection.query(
        'SELECT * FROM users WHERE mobile_no = ?',
        [mobile_no],
        async (err, results) => {
          if (err) return reject(err);
          if (results.length === 0) return reject(new Error('User not found'));

          const user = results[0];
          const isPasswordValid = await bcrypt.compare(password, user.password);

          if (!isPasswordValid) return reject(new Error('Invalid password'));
          if (!user.is_verified) return reject(new Error('User not verified'));

          resolve(user);
        }
      );
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
          const user = new User(userData.id, userData.mobile_no, userData.email, userData.password, userData.name, userData.shipping_address, userData.is_verified);
          resolve(user);
        }
      );
    });
  }


}

export default new UserService();
