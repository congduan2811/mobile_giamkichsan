import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/the-weather-controller.dart';
import 'package:mobile_giamkichsan/user-controls/item-list.dart';

class WeatherFuture extends StatelessWidget {
  const WeatherFuture({super.key});
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<int>> months = [];
    for (int i = 1; i <= 12; i++) {
      if (i == 1) {
        months.add(DropdownMenuEntry(value: i, label: "Tháng giêng"));
      } else if (i == 12) {
        months.add(DropdownMenuEntry(value: i, label: "Tháng chạp"));
      } else {
        months.add(DropdownMenuEntry(value: i, label: "Tháng $i"));
      }
    }
    Size size = MediaQuery.sizeOf(context);

    return Container(
        width: double
            .infinity, //width: size.width / 1.5, //Chia theo kich thuoc man hinh
        padding: const EdgeInsets.all(2.0),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Thời Tiết'),
            ),
            body: WeatherFutureHome(
              months: months,
            )));
  }
}

// ignore: must_be_immutable
class WeatherFutureHome extends StatefulWidget {
  WeatherFutureHome({super.key, required this.months});
  late List<DropdownMenuEntry<int>> months;
  TheWeatherController controller = TheWeatherController();
  @override
  State<WeatherFutureHome> createState() => _WeatherFutureHomeState();
}

class _WeatherFutureHomeState extends State<WeatherFutureHome> {
  String content = "";
  String description = "";
  int? monthCurrent = DateTime.now().month - 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 250, 211, 94),
            Color.fromARGB(255, 250, 211, 221),
          ])),
      child: ListView(padding: const EdgeInsets.all(5), children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownMenu<int>(
                  initialSelection: monthCurrent,
                  onSelected: (int? value) {
                    monthCurrent = value;
                  },
                  dropdownMenuEntries: widget.months,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    var item =
                        await widget.controller.getByMonth(monthCurrent!);
                    setState(() {
                      description = item.description;
                      content =
                          "${item.theweatherModel.name}: ${item.theweatherModel.description}";
                    });
                  },
                  child: Text('Xem'),
                )
              ],
            ),
            ItemList(title: "Diễn giải", description: content),
            ItemList(title: "Ghi chú", description: description),
          ],
        ),
      ]),
    );
  }
}
