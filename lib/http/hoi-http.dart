import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class HoiHttp extends BaseHttp {
  Future<http.Response> getHoiGetAll() {
    return getBase('Physiognomy/GetJson/Hoi_GetAll');
  }
}
