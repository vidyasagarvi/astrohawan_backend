class OTP {
    constructor(id, user_id, otp_code, expires_at) {
      this._id = id;
      this._user_id = user_id;
      this._otp_code = otp_code;
      this._expires_at = expires_at;
    }
  
    get id() {
      return this._id;
    }
  
    get user_id() {
      return this._user_id;
    }
  
    get otp_code() {
      return this._otp_code;
    }
  
    get expires_at() {
      return this._expires_at;
    }
  }
  
  export default OTP;
  