import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/async-file-controller.dart';
import 'package:mobile_giamkichsan/user-controls/item-list.dart';

class Horoscope extends StatelessWidget {
  const Horoscope({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double
            .infinity, //width: size.width / 1.5, //Chia theo kich thuoc man hinh
        padding: const EdgeInsets.all(2.0),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Đồng bộ dữ liệu'),
            ),
            body: const HoroscopeHome()));
  }
}

class HoroscopeHome extends StatefulWidget {
  const HoroscopeHome({super.key});
  @override
  State<HoroscopeHome> createState() => _BesthourHomeState();
}

class _BesthourHomeState extends State<HoroscopeHome> {
  TextEditingController urlPre = TextEditingController();
  bool isExecutting = false;
  String description = "";
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
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'API Link',
              ),
              keyboardType: TextInputType.text,
              controller: urlPre,
            ),
          )
        ]),
        const SizedBox(
          height: 5,
        ),
        if (!isExecutting)
          ElevatedButton(
            onPressed: () async {
              setState(() {
                isExecutting = true;
                description = "Đang xử lý ....";
              });
              String result = "";
              if (urlPre.text == "") {
                result = "Yêu cầu nhập API Link";
              } else {
                AsyncFileController asyncFileController = AsyncFileController();
                await asyncFileController.updateFilePhysiognomy(urlPre.text);
                result = "Đã đồng bộ xong";
              }
              setState(() {
                description = result;
                isExecutting = false;
              });
            },
            child: const Text('Đồng bộ'),
          ),
        ItemList(title: "Kết quả:", description: description),
      ]),
    );
  }
}
