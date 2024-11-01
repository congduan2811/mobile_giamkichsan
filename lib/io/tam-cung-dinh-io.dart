import 'dart:convert';
import 'dart:io';

import 'package:mobile_giamkichsan/configuration/enum-custom.dart';
import 'package:mobile_giamkichsan/http/tam-cung-dinh-http.dart';
import 'package:mobile_giamkichsan/io/base-io.dart';
import 'package:mobile_giamkichsan/models/tam-cung-dinh-model.dart';

class TamCungDinhIO extends BaseIO {
  late TamCungDinhHttp _repositoryHttp;

  TamCungDinhIO() : super() {
    _repositoryHttp = TamCungDinhHttp();
  }
  Future<void> setGetAll() async {
    try {
      final path = await localPath;
      File file = File('$path/${IOFileName.tamCungDinhGetAll.toString()}.json');
      var context = await _repositoryHttp.getTamCungDinhGetAll();
      if (context.statusCode == 200) {
        file.writeAsString(context.body, mode: FileMode.write);
      }
    } catch (ex) {
      print('TamCungDinhIO_setGetAll: $ex');
    }
  }

  Future<List<TamCungDinhModel>> getGetAll() async {
    List<TamCungDinhModel> result = [];
    try {
      var contents =
          await FileValue('${IOFileName.tamCungDinhGetAll.toString()}.json');
      result = (jsonDecode(contents) as List<dynamic>)
          .map((data) => TamCungDinhModel.fromJson(data))
          .toList();
    } catch (ex) {
      print('TamCungDinhIO_getGetAll: $ex');
    }
    return result;
  }
}
