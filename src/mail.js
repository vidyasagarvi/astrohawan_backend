import nodemailer from 'nodemailer';

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
  subject: 'Subject of the email',
  text: 'Body of the email'
};

transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    return console.log(error);
  }
  console.log('Email sent: ' + info.response);
});
