import 'package:flutter/material.dart';

class TheWeatherIcon extends StatelessWidget {
  const TheWeatherIcon({super.key, required this.nameIcon});
  final String nameIcon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        width: size.width / 1.5, //Chia theo kich thuoc man hinh
        padding: const EdgeInsets.all(30.0),
        child: Image.asset(
          'assets/weathers/images/$nameIcon.png',
          fit: BoxFit.cover, //Hình lớn hay nhỏ vẫn có thể bao toàn bộ khung
        ));
  }
}
