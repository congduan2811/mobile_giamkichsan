import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class CungHttp extends BaseHttp {
  Future<http.Response> getCungGetAll() {
    return getBase('Physiognomy/GetJson/Cung_GetAll');
  }
}
