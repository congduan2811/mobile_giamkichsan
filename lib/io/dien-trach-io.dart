import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/dien-trach-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/dien-trach-model.dart';
import 'package:mobile_giamkichsan/models/key-value-model.dart';

class DienTrachIO extends BaseIO {
  late DienTrachHttp _dienTrachHttp;

  DienTrachIO() : super() {
    _dienTrachHttp = DienTrachHttp();
  }

  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.dienTrachGetAll}.json');
      var context = await _dienTrachHttp.getDienTrachGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('DienTrachIO_setDienTrachGetAll: $ex');
    }
  }

  Future<List<DienTrachModel>> getGetAll() async {
    List<DienTrachModel> result = [];
    try {
      var contents =
          await FileValue('${IOFileName.dienTrachGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => DienTrachModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('DienTrachIO_getDienTrachGetAll: $ex');
    }
    return result;
  }

  Future<void> setDescription() async {
    try {
      final path = await localPath;
      File file =
          File('$path/${IOFileName.dienTrachDescription.toString()}.json');
      var context = await _dienTrachHttp.getDienTrachDescription();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('getDienTrachDescription: $ex');
    }
  }

  Future<String> getDescription() async {
    var result = "";
    try {
      var contents =
          await FileValue('${IOFileName.dienTrachDescription.toString()}.json');
      result = contents;
    } catch (ex) {
      print('getdienTrachDescription: $ex');
    }
    return result;
  }

  Future<void> setYearsBuildGetAll() async {
    try {
      final path = await localPath;
      File file =
          File('$path/${IOFileName.dienTrachYearsBuildGetAll.toString()}.json');
      var context = await _dienTrachHttp.getDienTrachYearsBuildGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('setDienTrachYearsBuildGetAll: $ex');
    }
  }

  Future<List<KeyValueModel>> getYearsBuildGetAll() async {
    List<KeyValueModel> result = [];
    try {
      var contents = await FileValue(
          '${IOFileName.dienTrachYearsBuildGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => KeyValueModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('DienTrachIO_getYearsBuildGetAll: $ex');
    }
    return result;
  }
}
