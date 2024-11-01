class BestHourModel {
  late int id = 0;
  late String name = "";
  late String firstHour = "";
  late String middleHour = "";
  late String finalHour = "";
  BestHourModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        firstHour = json['firstHour'] as String,
        middleHour = json['middleHour'] as String,
        finalHour = json['finalHour'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'firstHour': firstHour,
        'middleHour': middleHour,
        'finalHour': finalHour,
      };

  BestHourModel.newEmpty() {
    id = 0;
    name = "";
    firstHour = "";
    middleHour = "";
    finalHour = "";
  }
}
