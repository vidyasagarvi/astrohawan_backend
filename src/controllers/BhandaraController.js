
class BhandaraController {
 
  async addBhandara(req, res) {
    try {
      res.status(201).json(status=>"succes");

    } catch (error) {
      res.status(500).json({ message: 'Error adding product', error });
    }
  }

  
}

export default new BhandaraController();


