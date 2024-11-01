import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/api-theweather-internet-controller.dart';
import 'package:mobile_giamkichsan/models/api-theweather-internet-model.dart';
import 'package:mobile_giamkichsan/pages/the_weather_widget/the_weather_detail.dart';
import 'package:mobile_giamkichsan/pages/the_weather_widget/the_weather_icon.dart';
import 'package:mobile_giamkichsan/pages/the_weather_widget/the_weather_location.dart';
import 'package:mobile_giamkichsan/pages/the_weather_widget/the_weather_temperature.dart';

class TheWeatherHome extends StatelessWidget {
  TheWeatherHome({super.key});
  ApiTheweatherInternetController apiTheweatherInternetController =
      ApiTheweatherInternetController();
  TheWeatherInternet theWeatherInternet = TheWeatherInternet.newEmpty();
  ApiTheweatherInternetControllerModel apiTheweatherInternetControllerModel =
      ApiTheweatherInternetControllerModel.newEmpty();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiTheweatherInternetController.getTheweatherReal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          apiTheweatherInternetControllerModel =
              snapshot.data as ApiTheweatherInternetControllerModel;
          theWeatherInternet = apiTheweatherInternetController
              .getTheWeatherCurrent(apiTheweatherInternetControllerModel
                  .apiTheWeatherInternetModel);
        }
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff1D6CF3),
                  Color(0xff19D2FE),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TheWeatherIcon(
                  nameIcon: theWeatherInternet.weather[0].main.toLowerCase(),
                ),
                TheWeatherTemperature(theWeatherInternet: theWeatherInternet),
                TheWeatherLocation(
                    location: apiTheweatherInternetControllerModel
                        .addressIPInternetModel.region_name),
                TheWeatherDetail(theWeatherInternet: theWeatherInternet)
              ],
            ),
          ),
        );
      },
    );
  }
}
