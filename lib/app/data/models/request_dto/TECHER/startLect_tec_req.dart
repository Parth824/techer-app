
class StartLectRequestDto {
  String? link;
  StartLectRequestDto({
    this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
    };
  }
}