import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/tam-cung-dinh.controller.dart';
import 'package:mobile_giamkichsan/user-controls/item-list.dart';

class Married extends StatelessWidget {
  const Married({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double
            .infinity, //width: size.width / 1.5, //Chia theo kich thuoc man hinh
        padding: const EdgeInsets.all(2.0),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Xem duyên vợ chồng'),
            ),
            body: MarriedMain()));
  }
}

class MarriedMain extends StatefulWidget {
  const MarriedMain({super.key});
  @override
  State<MarriedMain> createState() => _MarriedMainState();
}

class _MarriedMainState extends State<MarriedMain> {
  TamCungDinhControllerModel tamCungDinhControllerModel =
      TamCungDinhControllerModel.newEmpty();
  TamCungDinhController tamCungDinhController = TamCungDinhController();
  TextEditingController nam = TextEditingController();
  TextEditingController nu = TextEditingController();
  int yearCurrent = DateTime.now().year;
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
        child: ListView(padding: const EdgeInsets.all(5), children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(child: Text('Năm sinh của Nam')),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 120,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Năm sinh',
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  controller: nam,
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(child: Text('Năm sinh của Nữ')),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 120,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Năm sinh',
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  controller: nu,
                ),
              ),
            ]),
            ElevatedButton(
              onPressed: () async {
                var temp = await tamCungDinhController.getByValue(
                    false, nam.text, false, nu.text);
                setState(() {
                  tamCungDinhControllerModel = temp;
                });
              },
              child: const Text('Xem'),
            ),
            ItemList(
                title: "Nhân duyên",
                description:
                    "Chồng ${tamCungDinhControllerModel.tamCungDinhModel.cungNam} và vợ ${tamCungDinhControllerModel.tamCungDinhModel.cungNu}: " +
                        tamCungDinhControllerModel.tamCungDinhModel.cuocSong),
          ]),
        ]));
  }
}
