class Apis {
  static const _baseUrl = 'http://176.58.99.160:8088/api/v1/';

  static const signUpApi = _baseUrl + 'register';
  static const loginApi = _baseUrl + 'login';
  static const OTPApi = _baseUrl + 'otp/verify';
  static const OTPResendApi = _baseUrl + 'otp/resend';
  static const setPassword = _baseUrl + 'pin/set';
}
