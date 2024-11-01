import 'dart:convert';

import 'package:mobile_giamkichsan/http/api-theweather-internet-http.dart';
import 'package:mobile_giamkichsan/models/api-theweather-internet-model.dart';

class ApiTheweatherInternetControllerModel {
  late AddressIPInternetModel addressIPInternetModel;
  late ApiTheWeatherInternetModel apiTheWeatherInternetModel;

  ApiTheweatherInternetControllerModel.newEmpty() {
    addressIPInternetModel = AddressIPInternetModel.newEmpty();
    apiTheWeatherInternetModel = ApiTheWeatherInternetModel.newEmpty();
  }
}

class ApiTheweatherInternetController {
  late ApiTheWeatherInternetHttp _apiTheWeatherInternetHttp;
  ApiTheweatherInternetController() {
    _apiTheWeatherInternetHttp = ApiTheWeatherInternetHttp();
  }
  Future<ApiTheweatherInternetControllerModel> getTheweatherReal() async {
    ApiTheweatherInternetControllerModel apiTheweatherInternetControllerModel =
        ApiTheweatherInternetControllerModel.newEmpty();
    try {
      var ipInternet = await _apiTheWeatherInternetHttp.getIpInternet();
      apiTheweatherInternetControllerModel.addressIPInternetModel =
          await _apiTheWeatherInternetHttp.getLocationIpAddress(ipInternet);
      apiTheweatherInternetControllerModel.apiTheWeatherInternetModel =
          await _apiTheWeatherInternetHttp.getDynamicTheWeather(
              apiTheweatherInternetControllerModel
                  .addressIPInternetModel.city_name);
    } catch (ex) {
      print(ex.toString());
    }
    return apiTheweatherInternetControllerModel;
  }

  TheWeatherInternet getTheWeatherCurrent(ApiTheWeatherInternetModel obj) {
    TheWeatherInternet out = TheWeatherInternet.newEmpty();
    DateTime dt = DateTime.now();
    for (TheWeatherInternet item in obj.list) {
      if (dt.compareTo(DateTime.parse(item.dt_txt)) > 0) {
        out = item;
      } else {
        break;
      }
    }
    return out;
  }
}
