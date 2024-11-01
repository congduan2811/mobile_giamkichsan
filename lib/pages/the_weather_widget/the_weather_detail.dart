import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/models/api-theweather-internet-model.dart';

class TheWeatherDetail extends StatelessWidget {
  const TheWeatherDetail({super.key, required this.theWeatherInternet});
  final TheWeatherInternet theWeatherInternet;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/weathers/icons/vector.png'),
            Text(
              '${theWeatherInternet.wind.speed.toString()}km/h',
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/weathers/icons/humidity.png'),
            Text(
              theWeatherInternet.main.humidity.toString(),
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
