import userService from '../services/UserService.js';

class UserController {
  async signup(req, res) {
    try {
      const user = await userService.addUser(req.body);
      const otp = await userService.generateOTP(user.id);
      // Send OTP to user via email or SMS
      res.status(201).json({ status: 'success', message: 'otpsent',  userId: user.id });
    } catch (error) {
      res.status(500).json({ sratus: 'failed', message : 'Error registering user', error });
    }
  }

  async verifyOTP(req, res) {
    try {
      const { userId, otpCode } = req.body;
      await userService.verifyOTP(userId, otpCode);
      res.status(200).json({ status: 'success', message: 'verified' });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error verifying OTP', error });
    }
  }

  async login(req, res) {
    try {
      const user = await userService.loginUser(req.body.mobile_no, req.body.password);

      res.status(200).json({ status: 'success', message : 'Login successful', user });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error logging in', error });
    }
  }

  async getUserDetails(req, res) {
    const authHeader = req.headers['authorization'];
    const userId = authHeader;
    try {
      const user = await userService.getUserById(userId);
      res.status(200).json({ message: 'User details retrieved successfully', user });
    } catch (error) {
      res.status(500).json({ message: 'Error retrieving user details', error: error.message });
    }
  }


}

export default new UserController();
