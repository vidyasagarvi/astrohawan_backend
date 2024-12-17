import userService from '../services/UserService.js';
import SendOTPMail from '../utility/SendOTPMail.js';


class UserController {
  async signup(req, res) {
    try {
     const user = await userService.addUser(req.body);
      const otp = await userService.generateOTP(user.id);
      const mailResponse =  await SendOTPMail.SendOTP(req.body.email,otp._otp_code);
    //  const otpresponse = await sendSMS.sendOTP(otp._otp_code);
      // Send OTP to user via email or SMS
      res.status(201).json({ status: 'success', message: 'otpsent',  userId: user.id });
    } catch (error) {
      if(error.code=='ER_DUP_ENTRY'){
        const mobileNoRegex = /mobile_no/;
        const emailRegex = /email/;
        const isMobileNoPresent = mobileNoRegex.test(error.sqlMessage);
        const isemailPresent = emailRegex.test(error.sqlMessage);
        if (isMobileNoPresent) {
          res.status(500).json({ sratus: 'failed', message : 'mobile_no_duplicate'});
        }
        if (isemailPresent) {
          res.status(500).json({ sratus: 'failed', message : 'email_duplicate'});
        }
      }else{
        res.status(500).json({ sratus: 'failed', message : 'Error registering user', error });
      }
    }
  }

  async verifyOTP(req, res) {
    try {
     const { userID, otp } = req.body;
     await userService.verifyOTP(userID, otp);
      res.status(200).json({ status: 'success', message: 'verified' });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error verifying OTP', error });
    }
  }

  async login(req, res) {
    try {
      const user = await userService.loginUser(req.body.email, req.body.password);
      res.status(200).json({ status: 'success', message : 'Login successful', user });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error logging in', error });
    }
  }


  async updatePassword(req, res) {
    try {
    const user = await userService.updatePassword(req.body);

      res.status(200).json({ status: 'success', message : 'Login successful', user });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error logging in', error });
    }
  }


  async forgotPassword(req, res) {
    try {
      console.log(req.body.email)
      const user = await userService.forgotPassword(req.body.email);
      res.status(200).json({ status: 'success', message : 'sent successful password', user });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error logging in', error });
    }
  }

  async getUserDetails(req, res) {
    const authHeader = req.headers['authorization'];
    const userId = authHeader;
    console.log(userId);
     try {
      const user = await userService.getUserById(userId);
      res.status(200).json({userID: user.id, name: user.name, mobile:user.mobile_no, email:user.email,shipping_address:user.shipping_address,pincode:user.pincode,verified:user.is_verified});
    } catch (error) {
      res.status(500).json({ message: 'Error retrieving user details', error: error.message });
    }
  }

}

export default new UserController();
