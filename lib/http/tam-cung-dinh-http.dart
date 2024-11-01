import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class TamCungDinhHttp extends BaseHttp {
  Future<http.Response> getTamCungDinhGetAll() {
    return getBase('Physiognomy/GetJson/TamCungDinh_GetAll');
  }
}
