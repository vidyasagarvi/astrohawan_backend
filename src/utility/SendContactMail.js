import nodemailer from 'nodemailer';

class SendContactMail {
  async SendMail(FROM,NAME,MOBILE,MESSAGE) {
    const transporter = nodemailer.createTransport({
      host: 'smtpout.secureserver.net',
      port: 465,
      secure: true,
      auth: {
        user: 'info@thesatim.com',
        pass: 'Ayansh@9899'
      }
    });

    // Email Template
    const mailOptions = {
      from: 'Contact inquiry <info@thesatim.com>',
      replyTo: FROM,
      to: "thesatims@gmail.com",
      subject: `Contact inquiry from ${NAME}`,
      html: `
       <div style="font-family: Arial, sans-serif; color: #333; max-width: 800px; margin: auto; padding: 0px; border-radius: 10px;border: 1px solid;">
          
          <!-- Header -->
          <div style="background-color: #5B1D06; padding: 5px; border-radius: 10px 10px 0 0;">
            <h2 style="color: #0066cc; margin: 0;"><img src="http://www.thesatim.com/static/media/site_logo.132f8b7af655f73b8021.png"/ width="95px" height="95px"> </h2>
          </div>
          
          <!-- Content -->
          <div style="padding: 20px;font-size: 14px;">
            <h3>Dear Santim,</h3>
           <p>I hope this message finds you well. I am reaching out regarding feedback, or question about the website or services.</p>
            <p style="font-size: 12px; font-weight: bold; color: #0066cc;">${MESSAGE}</p>

            <p>Thank you for your time and support. I look forward to your response.<p>

            <p>Best regards,</p>
            <p>${NAME}</p>
            <p>${MOBILE}</p>
            </div>
          
          <!-- Footer -->
          <div style="background-color: #212121; padding: 20px; text-align: center; border-radius: 0 0 10px 10px;color: #d4e0e1;font-size: 11px;">
            <p style="margin: 0;">Plot no 5, Sec -2A PNB Road, Vaishali Ghaziabad UP 201010 </p>
            <p style="margin: 0;">&#x2709; <a href="mailto:info@thesatim.com" style="color: #0066cc;">info@thesatim.com</a> | &#x260E; +91 70425 55040</p>
          </div>
        </div>
      `
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return console.log(error);
      }
      console.log('Email sent: ' + info.response);
    });
  }
}

export default new SendContactMail();
