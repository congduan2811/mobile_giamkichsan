import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/the-weather-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/theweather-model.dart';

class TheWeatherIO extends BaseIO {
  late TheWeatherHttp _theWeatherHttp;

  TheWeatherIO() : super() {
    _theWeatherHttp = TheWeatherHttp();
  }

  Future<void> setDescription() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.theWeatherDescription}.json');
      var context = await _theWeatherHttp.getDescription();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('setTheWeatherDescription: $ex');
    }
  }

  Future<String> getDescription() async {
    String contents = "";
    try {
      contents = await FileValue('${IOFileName.theWeatherDescription}.json');
    } catch (ex) {
      print('getTheWeatherDescription: $ex');
    }
    return contents;
  }

  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.theWeatherGetAll.toString()}.json');
      var context = await _theWeatherHttp.getAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('setTheWeatherGetAll: $ex');
    }
  }

  Future<List<TheweatherModel>> getGetAll() async {
    List<TheweatherModel> result = [];
    try {
      var contents =
          await FileValue('${IOFileName.theWeatherGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => TheweatherModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('getTheWeatherGetAll: $ex');
    }
    return result;
  }
}
