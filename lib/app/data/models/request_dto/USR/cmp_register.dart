// To parse this JSON data, do
//
//     final cmpRegisterReqModel = cmpRegisterReqModelFromJson(jsonString);

class CmpRegisterReqModel {
  String name;
  String image;
  String type;
  String industryType;
  String noOfEmp;
  String yourName;
  String yourRole;
  String email;
  String mobile;
  String password;
  String wallet;
  String city;
  String state;
  String country;

  CmpRegisterReqModel({
    required this.name,
    required this.image,
    required this.type,
    required this.industryType,
    required this.noOfEmp,
    required this.yourName,
    required this.yourRole,
    required this.email,
    required this.mobile,
    required this.password,
    required this.wallet,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "type": type,
        "industry_type": industryType,
        "no_of_emp": noOfEmp,
        "your_name": yourName,
        "your_role": yourRole,
        "email": email,
        "mobile": mobile,
        "password": password,
        "wallet": wallet,
        "city": city,
        "state": state,
        "country": country,
      };
}
