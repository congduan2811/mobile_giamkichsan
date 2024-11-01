class TamCungDinhModel {
  int id = 0;
  String cungNam = "";
  String cungNu = "";
  String cuocSong = "";
  TamCungDinhModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        cungNam = json['cungNam'] as String,
        cungNu = json['cungNu'] as String,
        cuocSong = json['cuocSong'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'cungNam': cungNam,
        'cungNu': cungNu,
        'cuocSong': cuocSong,
      };
  TamCungDinhModel.newEmpty() {
    id = 0;
    cungNam = "";
    cungNu = "";
    cuocSong = "";
  }
}
