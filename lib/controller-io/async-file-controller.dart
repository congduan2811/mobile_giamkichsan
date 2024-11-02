import 'package:mobile_giamkichsan/http/base-http.dart';
import 'package:mobile_giamkichsan/io/best-hour-io.dart';
import 'package:mobile_giamkichsan/io/cung-io.dart';
import 'package:mobile_giamkichsan/io/dien-trach-io.dart';
import 'package:mobile_giamkichsan/io/hoi-io.dart';
import 'package:mobile_giamkichsan/io/tam-cung-dinh-io.dart';
import 'package:mobile_giamkichsan/io/the-weather-io.dart';

class AsyncFileController {
  Future<bool> updateFilePhysiognomy(String preUrl) async {
    try {
      BaseHttp.preUrl = preUrl;
      var bestHour = BestHourIO();
      await bestHour.setGetAll();
      await bestHour.setBestHourHourTigerOfMonth();
      var cungIO = CungIO();
      await cungIO.setGetAll();
      var dientrach = DienTrachIO();
      await dientrach.setGetAll();
      await dientrach.setDescription();
      await dientrach.setYearsBuildGetAll();
      var hoiIO = HoiIO();
      await hoiIO.setGetAll();
      var tamCungDinhIO = TamCungDinhIO();
      await tamCungDinhIO.setGetAll();
      var weatherIO = TheWeatherIO();
      await weatherIO.setDescription();
      await weatherIO.setGetAll();
    } catch (ex) {
      print(ex.toString());
    }
    return true;
  }
}
