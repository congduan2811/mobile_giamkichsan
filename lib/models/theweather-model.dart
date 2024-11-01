class TheweatherModel {
  int id = 0;
  String name = "";
  String description = "";

  TheweatherModel.newEmpty() {
    id = 0;
    name = "";
    description = "";
  }

  TheweatherModel(int id, String name, String description) {
    this.id = id;
    this.name = name;
    this.description = description;
  }

  TheweatherModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        description = json['description'] as String;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'description': description};
}
