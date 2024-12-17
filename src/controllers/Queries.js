import QueriesService from '../services/Queries.js';
import sendMail from '../utility/SendMail.js';

class QueriesController {
  async add(req, res) {
    try {
      const user = await QueriesService.add(req.body);
     const mailResponse =  await sendMail.SendMail(req.body.email,req.body.message,'inquiry');
     console.log("mailResponse",mailResponse)
      res.status(201).json({ status: 'success', message: 'sent'});
    } catch (error) {
        res.status(500).json({ sratus: 'failed', message : 'notsent', error });
    }
  }


}

export default new QueriesController();
