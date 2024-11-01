class DienTrachModel {
  int id = 0;
  int hoiID = 0;
  String description = "";
  DienTrachModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        hoiID = json['hoiID'] as int,
        description = json['description'] as String;

  Map<String, dynamic> toJson() =>
      {'id': id, 'hoiID': hoiID, 'description': description};

  DienTrachModel.newEmpty() {
    id = 0;
    hoiID = 0;
    description = "";
  }
}
