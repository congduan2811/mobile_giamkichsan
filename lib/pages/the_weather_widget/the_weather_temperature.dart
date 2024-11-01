import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/models/api-theweather-internet-model.dart';

class TheWeatherTemperature extends StatelessWidget {
  TheWeatherTemperature({super.key, required this.theWeatherInternet});
  final TheWeatherInternet theWeatherInternet;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            theWeatherInternet.main.temp.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 100),
          ),
          Text(
            'o',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 36),
          ),
        ]);
  }
}
