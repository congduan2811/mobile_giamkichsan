import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class TheBestHourHttp extends BaseHttp {
  Future<http.Response> getBestHourGetAll() {
    return getBase('Physiognomy/GetJson/BestHour_GetAll');
  }

  Future<http.Response> getBestHourHourTigerOfMonthGetAll() {
    return getBase('Physiognomy/GetJson/BestHour_HourTigerOfMonthGetAll');
  }
}
