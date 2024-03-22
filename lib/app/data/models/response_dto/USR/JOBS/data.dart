import 'dart:convert';

class JobDetailData {
  final String id;
  final String company_id;
  final String company_name;
  final int type;
  final String position;
  final int vacancy;
  final String description;
  final String technology;
  final String salary;
  final String address;
  final int active;
  final String createdAt;
  final String updatedAt;
  final int v;
  JobDetailData({
    required this.id,
    required this.company_id,
    required this.company_name,
    required this.type,
    required this.position,
    required this.vacancy,
    required this.description,
    required this.technology,
    required this.salary,
    required this.address,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  JobDetailData copyWith({
    String? id,
    String? company_id,
    String? company_name,
    int? type,
    String? position,
    int? vacancy,
    String? description,
    String? technology,
    String? salary,
    String? address,
    int? active,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return JobDetailData(
      id: id ?? this.id,
      company_id: company_id ?? this.company_id,
      company_name: company_name ?? this.company_name,
      type: type ?? this.type,
      position: position ?? this.position,
      vacancy: vacancy ?? this.vacancy,
      description: description ?? this.description,
      technology: technology ?? this.technology,
      salary: salary ?? this.salary,
      address: address ?? this.address,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'company_id': company_id,
      'company_name': company_name,
      'type': type,
      'position': position,
      'vacancy': vacancy,
      'description': description,
      'technology': technology,
      'salary': salary,
      'address': address,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory JobDetailData.fromMap(Map<String, dynamic> map) {
    return JobDetailData(
      id: map['_id'] as String,
      company_id: map['company_id'] as String,
      company_name: map['company_name'] as String,
      type: map['type'].toInt() as int,
      position: map['position'] as String,
      vacancy: map['vacancy'].toInt() as int,
      description: map['description'] as String,
      technology: map['technology'] as String,
      salary: map['salary'] as String,
      address: map['address'] as String,
      active: map['active'].toInt() as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['__v'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobDetailData.fromJson(String source) =>
      JobDetailData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(_id: $id, company_id: $company_id, company_name: $company_name, type: $type, position: $position, vacancy: $vacancy, description: $description, technology: $technology, salary: $salary, address: $address, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

 
}
