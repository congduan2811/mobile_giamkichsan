class HoiModel {
  int id = 0;
  String name = "";
  String code = "";
  int year = 0;

  HoiModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        code = json['code'] as String,
        year = json['year'] as int;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'year': year,
      };

  HoiModel.newEmpty() {
    id = 0;
    name = "";
    code = "";
    year = 0;
  }
}
