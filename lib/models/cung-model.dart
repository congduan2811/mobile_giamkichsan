class CungModel {
  int id = 0;
  int hoiID = 0;
  String cungNam = "";
  String moTaNam = "";
  String cungNu = "";
  String moTaNu = "";
  CungModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        hoiID = json['hoiID'] as int,
        cungNam = json['cungNam'] as String,
        moTaNam = json['moTaNam'] as String,
        cungNu = json['cungNu'] as String,
        moTaNu = json['moTaNu'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'hoiID': hoiID,
        'cungNam': cungNam,
        'moTaNam': moTaNam,
        'cungNu': cungNu,
        'moTaNu': moTaNu,
      };
}
