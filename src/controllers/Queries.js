import QueriesService from '../services/Queries.js';
import SendContactMail from '../utility/SendContactMail.js';

class QueriesController {
  async add(req, res) {
    try {
      const user = await QueriesService.add(req.body);
      const mailResponse =  await SendContactMail.SendMail(req.body.email,req.body.name,req.body.mobile_no,req.body.message);
      res.status(201).json({ status: 'success', message: 'sent'});
    } catch (error) {
        res.status(500).json({ sratus: 'failed', message : 'notsent', error });
    }
  }


}

export default new QueriesController();
