import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/user-controls/combobox-app.dart';
import 'package:mobile_giamkichsan/user-controls/radio-app.dart';

class RadioHoiApp extends StatelessWidget {
  RadioHoiApp({super.key, required this.onChanged, required this.isHoi});
  final ValueChanged<String?> onChanged;
  late bool isHoi;
  @override
  Widget build(BuildContext context) {
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
            Row(children: [
              RadioApp(
                  title: 'Năm sinh',
                  onChanged: (String? valuechange) {
                    isHoi = bool.parse(valuechange!);
                  },
                  value: false.toString(),
                  groupValue: isHoi.toString()),
              ComboboxYear(onChanged: onChanged)
            ]),
            Row(
              children: [
                RadioApp(
                    title: 'Can chi',
                    onChanged: (String? valuechange) {
                      isHoi = bool.parse(valuechange!);
                    },
                    value: true.toString(),
                    groupValue: isHoi.toString()),
                ComboboxHoi(onChanged: onChanged)
              ],
            )
          ],
        ),
      ),
    );
  }
}
