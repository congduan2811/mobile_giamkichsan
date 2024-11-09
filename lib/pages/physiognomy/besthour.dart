import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/best-hour-controller.dart';
import 'package:mobile_giamkichsan/user-controls/item-list.dart';

class Besthour extends StatelessWidget {
  const Besthour({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double
            .infinity, //width: size.width / 1.5, //Chia theo kich thuoc man hinh
        padding: const EdgeInsets.all(2.0),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Xem giờ đẹp'),
            ),
            body: BesthourHome()));
  }
}

class BesthourHome extends StatefulWidget {
  const BesthourHome({super.key});
  @override
  State<BesthourHome> createState() => _BesthourHomeState();
}

class _BesthourHomeState extends State<BesthourHome> {
  bool isAll = true;
  BestHourControllerModel bestHourControllerModel =
      BestHourControllerModel.newEmpty();
  BestHourController bestHourController = BestHourController();
  TextEditingController ngay = TextEditingController();
  TextEditingController thang = TextEditingController();
  TextEditingController nam = TextEditingController();
  TextEditingController timmer = TextEditingController();
  DateTime timeIniti = DateTime.now();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
                value: true,
                groupValue: isAll,
                onChanged: (bool? value) {
                  setState(() {
                    isAll = value!;
                  });
                }),
            const Text('Giờ đẹp trong ngày'),
            SizedBox(
              width: 10,
            ),
            Radio(
                value: false,
                groupValue: isAll,
                onChanged: (bool? value) {
                  setState(() {
                    isAll = value!;
                  });
                }),
            const Text('Xem giờ sinh'),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 90,
            child: DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "01", label: "01"),
                DropdownMenuEntry(value: "02", label: "02"),
                DropdownMenuEntry(value: "03", label: "03"),
                DropdownMenuEntry(value: "04", label: "04"),
                DropdownMenuEntry(value: "05", label: "05"),
                DropdownMenuEntry(value: "06", label: "06"),
                DropdownMenuEntry(value: "07", label: "07"),
                DropdownMenuEntry(value: "08", label: "08"),
                DropdownMenuEntry(value: "09", label: "09"),
                DropdownMenuEntry(value: "10", label: "10"),
                DropdownMenuEntry(value: "11", label: "11"),
                DropdownMenuEntry(value: "12", label: "12"),
                DropdownMenuEntry(value: "13", label: "13"),
                DropdownMenuEntry(value: "14", label: "14"),
                DropdownMenuEntry(value: "15", label: "15"),
                DropdownMenuEntry(value: "16", label: "16"),
                DropdownMenuEntry(value: "17", label: "17"),
                DropdownMenuEntry(value: "18", label: "18"),
                DropdownMenuEntry(value: "19", label: "19"),
                DropdownMenuEntry(value: "20", label: "20"),
                DropdownMenuEntry(value: "21", label: "21"),
                DropdownMenuEntry(value: "22", label: "22"),
                DropdownMenuEntry(value: "23", label: "23"),
                DropdownMenuEntry(value: "24", label: "24"),
                DropdownMenuEntry(value: "25", label: "25"),
                DropdownMenuEntry(value: "26", label: "26"),
                DropdownMenuEntry(value: "27", label: "27"),
                DropdownMenuEntry(value: "28", label: "28"),
                DropdownMenuEntry(value: "29", label: "29"),
                DropdownMenuEntry(value: "30", label: "30"),
              ],
              initialSelection: timeIniti.day.toString(),
              label: Text('Ngày'),
              textStyle: TextStyle(color: Colors.black),
              controller: ngay,
            ),
          ),
          SizedBox(
            width: 180,
            child: DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "01", label: "01"),
                DropdownMenuEntry(value: "02", label: "02"),
                DropdownMenuEntry(value: "03", label: "03"),
                DropdownMenuEntry(value: "04", label: "04"),
                DropdownMenuEntry(value: "05", label: "05"),
                DropdownMenuEntry(value: "06", label: "06"),
                DropdownMenuEntry(value: "07", label: "07"),
                DropdownMenuEntry(value: "08", label: "08"),
                DropdownMenuEntry(value: "09", label: "09"),
                DropdownMenuEntry(value: "10", label: "10"),
                DropdownMenuEntry(value: "11", label: "11"),
                DropdownMenuEntry(value: "12", label: "12"),
              ],
              initialSelection: "12",
              label: Text('Tháng'),
              textStyle: TextStyle(color: Colors.black),
              controller: thang,
            ),
          ),
          SizedBox(
            width: 100,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Năm',
              ),
              keyboardType: TextInputType.number,
              controller: nam,
            ),
          )
        ]),
        SizedBox(
          height: 5,
        ),
        if (!isAll)
          TextField(
            controller: timmer,
            decoration: InputDecoration(
              labelText: 'Giờ phút',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              var picker = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 10, minute: 10),
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  );
                },
              );
              if (picker != null) {
                setState(() {
                  timmer.text =
                      picker.hour.toString() + ":" + picker.minute.toString();
                });
              }
            },
          ),
        ElevatedButton(
          onPressed: () async {
            BestHourControllerModel temp = BestHourControllerModel.newEmpty();
            if (isAll) {
              temp = await bestHourController.getBestHourInDay(
                  nam.text, thang.text, ngay.text);
            } else {
              temp = await bestHourController.getBestHourBirthday(
                  nam.text, thang.text, ngay.text, timmer.text);
            }
            setState(() {
              bestHourControllerModel = temp;
            });
          },
          child: const Text('Xem'),
        ),
        ItemList(
            title: "Ghi ghú",
            description: isAll
                ? bestHourControllerModel.bestHourInDayDescription.join("\n")
                : bestHourControllerModel.descriptionBirthday),
      ]),
    );
  }
}
