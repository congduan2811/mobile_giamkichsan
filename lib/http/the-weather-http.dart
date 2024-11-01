import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class TheWeatherHttp extends BaseHttp {
  Future<http.Response> getDescription() {
    return getBase('Physiognomy/GetJson/TheWeather_Description');
  }

  Future<http.Response> getAll() {
    return getBase('Physiognomy/GetJson/TheWeather_GetAll');
  }
}
