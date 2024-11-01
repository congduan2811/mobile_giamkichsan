class KeyValueModel {
  int key = 0;
  String value = "";
  KeyValueModel.fromJson(Map<String, dynamic> json)
      : key = json['key'] as int,
        value = json['value'] as String;
  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };
  KeyValueModel.newEmpty() {
    this.key = 0;
    this.value = "";
  }
  KeyValueModel(int key, String value) {
    this.key = key;
    this.value = value;
  }
}
