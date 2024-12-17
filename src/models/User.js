class User {
    constructor(id, mobile_no, email, password, name, shipping_address, pincode, is_verified = false) {
      this._id = id;
      this._mobile_no = mobile_no;
      this._email = email;
      this._password = password;
      this._name = name;
      this._shipping_address = shipping_address;
      this._pincode = pincode;
      this._is_verified = is_verified;
    }
  
    get id() {
      return this._id;
    }
  
    get mobile_no() {
      return this._mobile_no;
    }
  
    get email() {
      return this._email;
    }
  
    get password() {
      return this._password;
    }
  
    get name() {
      return this._name;
    }
  
    get shipping_address() {
      return this._shipping_address;
    }

    get pincode() {
      return this._pincode;
    }
  
    get is_verified() {
      return this._is_verified;
    }
  
    set is_verified(is_verified) {
      this._is_verified = is_verified;
    }
  }
  
  export default User;
  