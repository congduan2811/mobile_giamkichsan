import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/cung-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/cung-model.dart';

class CungIO extends BaseIO {
  late CungHttp _repositoryHttp;

  CungIO() : super() {
    _repositoryHttp = CungHttp();
  }
  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.cungGetAll.toString()}.json');
      var context = await _repositoryHttp.getCungGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('CungIO_setGetAll: $ex');
    }
  }

  Future<List<CungModel>> getGetAll() async {
    List<CungModel> result = [];
    try {
      var contents =
          await FileValue('${IOFileName.cungGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => CungModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('BestHourModelgetGetAll: $ex');
    }
    return result;
  }
}
