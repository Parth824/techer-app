// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginRequestDto {
  String? email;
  String? password;
  LoginRequestDto({
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