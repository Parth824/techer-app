class UserRegisterReq {
  final String firstName;
  final String email;
  final String mobile;
  final String whatsapp;
  final String password;
  final String confirmPassword;
  UserRegisterReq({
    required this.firstName,
    required this.email,
    required this.mobile,
    required this.whatsapp,
    required this.password,
    required this.confirmPassword,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'email': email,
      'mobile': mobile,
      'whats_app': whatsapp,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}