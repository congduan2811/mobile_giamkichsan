import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/hoi-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/hoi-model.dart';

class HoiIO extends BaseIO {
  late HoiHttp _repositoryHttp;

  HoiIO() : super() {
    _repositoryHttp = HoiHttp();
  }
  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.hoiGetAll.toString()}.json');
      var context = await _repositoryHttp.getHoiGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('CungIO_setGetAll: $ex');
    }
  }

  Future<List<HoiModel>> getGetAll() async {
    List<HoiModel> result = [];
    try {
      var contents = await FileValue('${IOFileName.hoiGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => HoiModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('HoiModelgetGetAll: $ex');
    }
    return result;
  }
}
