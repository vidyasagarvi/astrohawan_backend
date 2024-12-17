import nodemailer from 'nodemailer';

class SendSMS {

  async sendOTP(OTP) {

    const transporter = nodemailer.createTransport({
        host: 'smtpout.secureserver.net',
        port: 465,
        secure: true, // true for 465, false for other ports
        auth: {
          user: 'info@thesatim.com', // your email address
          pass: 'Ayansh@9899' // your email password
        }
      });
      
      // Sending an email
      const mailOptions = {
        from: 'info@thesatim.com',
        to: 'vidyasagar.vi@gmail.com',
        subject: 'Santim One time password',
        text: `Your Santim account verification code is: ${OTP}` 
      };
      
      transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
          return console.log(error);
        }
        console.log('Email sent: ' + info.response);
      });




  }

}

export default new SendSMS();
