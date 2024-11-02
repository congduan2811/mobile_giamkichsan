import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_giamkichsan/configuration/theme-custum.dart';
import 'package:mobile_giamkichsan/controller-io/async-file-controller.dart';
import 'package:mobile_giamkichsan/pages/physiognomy/besthour.dart';
import 'package:mobile_giamkichsan/pages/physiognomy/horoscope.dart';
import 'package:mobile_giamkichsan/pages/physiognomy/married.dart';
import 'package:mobile_giamkichsan/pages/physiognomy/profile-person.dart';
import 'package:mobile_giamkichsan/pages/physiognomy/weather-future.dart';
import 'package:mobile_giamkichsan/pages/the_weather-home.dart';

class PhysiognomyMain extends StatelessWidget {
  const PhysiognomyMain({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tra cứu TỬ VI',
      theme: ThemeCustom.themeLight,
      debugShowCheckedModeBanner: false,
      home: const MainFulWidget(),
    );
  }
}

class MainFulWidget extends StatefulWidget {
  const MainFulWidget({super.key});
  @override
  State<MainFulWidget> createState() => _MainFulWidgetState();
}

class _MainFulWidgetState extends State<MainFulWidget> {
  int activePage = 0;
  bool isAsync = false;
  List<Widget> listPage = [
    TheWeatherHome(),
    const ProfilePerson(),
    const Besthour(),
    const Married(),
    const WeatherFuture(),
    const Horoscope(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPage[activePage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activePage = 0;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Xem thời tiết')),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activePage = 1;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Xem tử vi trọn đời')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activePage = 2;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Giờ đẹp')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activePage = 3;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Gia đình')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activePage = 4;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Thời tiết')),
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (!isAsync) {
                                      activePage = 5;
                                      isAsync = true;
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text('Đồng bộ'))),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          CupertinoIcons.list_bullet,
          size: 40,
        ),
      ),
    );
  }
}
