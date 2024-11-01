import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';

class DienTrachHttp extends BaseHttp {
  Future<http.Response> getDienTrachGetAll() {
    return getBase('Physiognomy/GetJson/DienTrach_GetAll');
  }

  Future<http.Response> getDienTrachDescription() {
    return getBase('Physiognomy/GetJson/DienTrach_Description');
  }

  Future<http.Response> getDienTrachYearsBuildGetAll() {
    return getBase('Physiognomy/GetJson/DienTrach_YearsBuildGetAll');
  }
}
