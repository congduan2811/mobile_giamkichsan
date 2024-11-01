import 'package:mobile_giamkichsan/io/the-weather-io.dart';
import 'package:mobile_giamkichsan/models/theweather-model.dart';

class TheWeatherControllerModel {
  late String description;
  late TheweatherModel theweatherModel;
  TheWeatherControllerModel(
      {required this.description, required this.theweatherModel});
}

class TheWeatherController {
  late TheWeatherIO _theWeatherIO;
  TheWeatherController() {
    _theWeatherIO = TheWeatherIO();
  }

  Future<TheWeatherControllerModel> getByMonth(int month) async {
    TheweatherModel theweatherModel = TheweatherModel.newEmpty();
    var list = await _theWeatherIO.getGetAll();
    if (list.any((x) => x.id == month)) {
      theweatherModel = list.firstWhere((x) => x.id == month);
    }
    return TheWeatherControllerModel(
        description: await _theWeatherIO.getDescription(),
        theweatherModel: theweatherModel);
  }
}
