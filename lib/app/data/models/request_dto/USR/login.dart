// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginRequestModel {
  String? email;
  String? password;
  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }


}
