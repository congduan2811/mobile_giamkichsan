import 'package:http/http.dart' as http;

class BaseHttp {
  final String _preUrl = "http://giamkichsan.somee.com";
  Future<http.Response> getBase(String pathGet) {
    return http.get(Uri.parse('$_preUrl/$pathGet'));
  }

  Future<http.Response> getBaseFullUrl(String fullUrl) {
    return http.get(Uri.parse(fullUrl));
  }
}
