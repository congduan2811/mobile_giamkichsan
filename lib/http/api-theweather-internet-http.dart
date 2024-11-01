import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_giamkichsan/http/base-http.dart';
import 'package:mobile_giamkichsan/models/api-theweather-internet-model.dart';

class ApiTheWeatherInternetHttp extends BaseHttp {
  final String _getUrlIP = "http://checkip.dyndns.org";
  late String _ipAddress = "";
  String _urlGetLocation(String ip) {
    return "https://api.ip2location.io/?key=25535F71030ED272139ABB2C8A49AF2E&ip=$ip";
  }

  String _getUrlTheWeather(String location) {
    return "https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=da3d39c37b90969495cb240bc2d27a6e&units=metric";
  }

  Future<String> getIpInternet() async {
    var context = await getBaseFullUrl(_getUrlIP);
    if (context.statusCode != 200) {
      return "";
    }
    int first = context.body.indexOf("Address: ") + 9;
    int last = context.body.lastIndexOf("</body>");
    return context.body.substring(first, last);
  }

  Future<AddressIPInternetModel> getLocationIpAddress(String ipAddress) async {
    var context = await getBaseFullUrl(_urlGetLocation(ipAddress));
    if (context.statusCode != 200) {
      return AddressIPInternetModel.newEmpty();
    }
    return AddressIPInternetModel.fromJson(jsonDecode(context.body));
  }

  Future<ApiTheWeatherInternetModel> getDynamicTheWeather(
      String city_name) async {
    var context = await getBaseFullUrl(_getUrlTheWeather(city_name));
    if (context.statusCode != 200) {
      return ApiTheWeatherInternetModel.newEmpty();
    }
    return ApiTheWeatherInternetModel.fromJson(jsonDecode(context.body));
  }
}
