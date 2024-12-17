class Queries {
    
    constructor(id, name, email, mobile_no, message) {
      this._id = id;
      this._name = name;
      this._email = email;
      this._mobile_no = mobile_no;
      this._message = message;
    }
  
    get id() {
      return this._id;
    }

     
    get name() {
        return this._name;
      }


    get email() {
        return this._email;
      }
    
  
    get mobile_no() {
      return this._mobile_no;
    }
  
  
    get message() {
      return this._message;
    }

  }
  
  export default Queries;
  