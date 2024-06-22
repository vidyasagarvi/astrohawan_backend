import AdminService from '../../services/admin/AdminService.js';

class AdminController {

  async login(req, res) {
    try {
      const admin = await AdminService.loginAdmin(req.body.email, req.body.password);

      res.status(200).json({ status: 'success', message : 'Login successful', admin });
    } catch (error) {
      res.status(500).json({status: 'failed', message: 'Error logging in', error });
    }
  }


}

export default new AdminController();
