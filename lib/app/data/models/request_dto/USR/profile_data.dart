// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ProfileData {
  final String? id;
  final String? profile;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone_code;
  final String? mobile;
  final int? whats_app;
  final String? city;
  final String? second_city;
  final String? mother_tongue;
  final int language;
  final String? linkedin_profile;
  final String? about_yourself;
  final String? wallet;
  final String? token;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  ProfileData({
    this.id,
    this.profile,
    this.first_name,
    this.last_name,
    this.email,
    this.password,
    this.gender,
    this.phone_code,
    this.mobile,
    this.whats_app,
    this.city,
    this.second_city,
    this.mother_tongue,
    required this.language,
    this.linkedin_profile,
    this.about_yourself,
    this.wallet,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
 

  ProfileData copyWith({
    String? id,
    String? profile,
    String? first_name,
    String? last_name,
    String? email,
    String? password,
    String? gender,
    String? phone_code,
    String? mobile,
    int? whats_app,
    String? city,
    String? second_city,
    String? mother_tongue,
    int? language,
    String? linkedin_profile,
    String? about_yourself,
    String? wallet,
    String? token,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return ProfileData(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      phone_code: phone_code ?? this.phone_code,
      mobile: mobile ?? this.mobile,
      whats_app: whats_app ?? this.whats_app,
      city: city ?? this.city,
      second_city: second_city ?? this.second_city,
      mother_tongue: mother_tongue ?? this.mother_tongue,
      language: language ?? this.language,
      linkedin_profile: linkedin_profile ?? this.linkedin_profile,
      about_yourself: about_yourself ?? this.about_yourself,
      wallet: wallet ?? this.wallet,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profile': profile,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'gender': gender,
      'phone_code': phone_code,
      'mobile': mobile,
      'whats_app': whats_app,
      'city': city,
      'second_city': second_city,
      'mother_tongue': mother_tongue,
      'language': language,
      'linkedin_profile': linkedin_profile,
      'about_yourself': about_yourself,
      'wallet': wallet,
      'token': token,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  factory ProfileData.fromMap(Map<String, dynamic> map) {
    return ProfileData(
      id: map['id'] != null ? map['id'] as String : null,
      profile: map['profile'] != null ? map['profile'] as String : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      phone_code: map['phone_code'] != null ? map['phone_code'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      whats_app: map['whats_app'] != null ? map['whats_app'] as int : null,
      city: map['city'] != null ? map['city'] as String : null,
      second_city: map['second_city'] != null ? map['second_city'] as String : null,
      mother_tongue: map['mother_tongue'] != null ? map['mother_tongue'] as String : null,
      language: map['language'] as int,
      linkedin_profile: map['linkedin_profile'] != null ? map['linkedin_profile'] as String : null,
      about_yourself: map['about_yourself'] != null ? map['about_yourself'] as String : null,
      wallet: map['wallet'] != null ? map['wallet'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      v: map['v'] != null ? map['v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileData.fromJson(String source) => ProfileData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileData(id: $id, profile: $profile, first_name: $first_name, last_name: $last_name, email: $email, password: $password, gender: $gender, phone_code: $phone_code, mobile: $mobile, whats_app: $whats_app, city: $city, second_city: $second_city, mother_tongue: $mother_tongue, language: $language, linkedin_profile: $linkedin_profile, about_yourself: $about_yourself, wallet: $wallet, token: $token, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

}
