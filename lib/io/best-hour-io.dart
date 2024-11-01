import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/the-best-hour-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/best-hour-model.dart';
import 'package:mobile_giamkichsan/models/key-value-model.dart';

class BestHourIO extends BaseIO {
  late TheBestHourHttp _theBestHourHttp;

  BestHourIO() : super() {
    _theBestHourHttp = TheBestHourHttp();
  }

  Future<void> setBestHourHourTigerOfMonth() async {
    try {
      final path = await localPath;
      File file =
          File('$path/${IOFileName.bestHourHourTigerOfMonthGetAll}.json');
      var context = await _theBestHourHttp.getBestHourHourTigerOfMonthGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('setBestHourHourTigerOfMonth: $ex');
    }
  }

  Future<List<KeyValueModel>> getBestHourHourTigerOfMonth() async {
    List<KeyValueModel> result = [];
    try {
      var contents = await FileValue(
          '${IOFileName.bestHourHourTigerOfMonthGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => KeyValueModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('getBestHourHourTigerOfMonth: $ex');
    }
    return result;
  }

  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.bestHourGetAll.toString()}.json');
      var context = await _theBestHourHttp.getBestHourGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('BestHourModelSetGetAll: $ex');
    }
  }

  Future<List<BestHourModel>> getGetAll() async {
    List<BestHourModel> result = [];
    try {
      var contents =
          await FileValue('${IOFileName.bestHourGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => BestHourModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('BestHourModelgetGetAll: $ex');
    }
    return result;
  }
}
