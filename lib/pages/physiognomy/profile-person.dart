import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/controller-io/profile-person.controller.dart';
import 'package:mobile_giamkichsan/user-controls/item-list.dart';

class ProfilePerson extends StatelessWidget {
  const ProfilePerson({super.key});

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
            body: ProfilePersionMain()));
  }
}

class ProfilePersionMain extends StatefulWidget {
  const ProfilePersionMain({super.key});
  @override
  State<ProfilePersionMain> createState() => _ProfilePersionMainState();
}

class _ProfilePersionMainState extends State<ProfilePersionMain> {
  bool isHoi = true;
  String hoi = "";
  ProfilePersonControllerModel profilePersonControllerModel =
      ProfilePersonControllerModel.newEmpty();
  ProfilePersonController profilePersonController = ProfilePersonController();
  TextEditingController nam = TextEditingController();
  TextEditingController can = TextEditingController();
  TextEditingController chi = TextEditingController();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                    value: true,
                    groupValue: isHoi,
                    onChanged: (bool? value) {
                      setState(() {
                        isHoi = value!;
                      });
                    }),
                const Text('Can chi'),
                SizedBox(
                  width: 10,
                ),
                Radio(
                    value: false,
                    groupValue: isHoi,
                    onChanged: (bool? value) {
                      setState(() {
                        isHoi = value!;
                      });
                    }),
                const Text('Năm sinh'),
              ],
            ),
            if (isHoi)
              Row(
                children: [
                  DropdownMenu(
                    dropdownMenuEntries: [
                      DropdownMenuEntry<String>(value: "Bính ", label: "Bính"),
                      DropdownMenuEntry<String>(value: "Đinh ", label: "Đinh"),
                      DropdownMenuEntry<String>(value: "Mậu ", label: "Mậu"),
                      DropdownMenuEntry<String>(value: "Kỷ ", label: "Kỷ"),
                      DropdownMenuEntry<String>(value: "Canh ", label: "Canh"),
                      DropdownMenuEntry<String>(value: "Tân ", label: "Tân"),
                      DropdownMenuEntry<String>(value: "Nhâm ", label: "Nhâm"),
                      DropdownMenuEntry<String>(value: "Quý ", label: "Quý"),
                      DropdownMenuEntry<String>(value: "Giáp ", label: "Giáp"),
                      DropdownMenuEntry<String>(value: "Ất ", label: "Ất"),
                    ],
                    initialSelection: "Bính",
                    label: Text('Can'),
                    textStyle: TextStyle(color: Colors.black),
                    controller: can,
                  ),
                  DropdownMenu(
                    dropdownMenuEntries: [
                      DropdownMenuEntry<String>(value: "Tý ", label: "Tý"),
                      DropdownMenuEntry<String>(value: "Sửu ", label: "Sửu"),
                      DropdownMenuEntry<String>(value: "Dần ", label: "Dần"),
                      DropdownMenuEntry<String>(value: "Mão ", label: "Mão"),
                      DropdownMenuEntry<String>(value: "Thìn ", label: "Thìn"),
                      DropdownMenuEntry<String>(value: "Tỵ ", label: "Tỵ"),
                      DropdownMenuEntry<String>(value: "Ngọ ", label: "Ngọ"),
                      DropdownMenuEntry<String>(value: "Mùi ", label: "Mùi"),
                      DropdownMenuEntry<String>(value: "Thân ", label: "Thân"),
                      DropdownMenuEntry<String>(value: "Dậu ", label: "Dậu"),
                      DropdownMenuEntry<String>(value: "Tuất ", label: "Tuất"),
                      DropdownMenuEntry<String>(value: "Hợi ", label: "Hợi"),
                    ],
                    initialSelection: "Tý",
                    label: Text('Chi'),
                    textStyle: TextStyle(color: Colors.black),
                    controller: chi,
                  ),
                ],
              )
            else
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: 120,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nam Sinh',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    controller: nam,
                  ),
                ),
              ]),
            ElevatedButton(
              onPressed: () async {
                hoi = isHoi ? (can.text + " " + chi.text) : nam.text;
                var temp = await profilePersonController.getByValue(isHoi, hoi);
                setState(() {
                  profilePersonControllerModel = temp;
                });
              },
              child: const Text('Xem'),
            ),
            ItemList(
                title:
                    "Điền trạch của ${profilePersonControllerModel.hoiModel.name} :",
                description:
                    profilePersonControllerModel.dienTrachModel.description),
            ItemList(
                title: "Tuổi làm nhà:",
                description: profilePersonControllerModel.tuoiLamNha
                    .map((i) => i.key.toString() + ": " + i.value)
                    .toString()),
            ItemList(
                title: "Ghi ghú",
                description: profilePersonControllerModel.description),
          ]),
        ]));
  }
}
