import 'package:flutter/material.dart';

class ComboboxApp extends StatelessWidget {
  ComboboxApp({super.key, required this.onChanged, required this.listItem});
  late List<DropdownMenuEntry<String>> listItem;
  final ValueChanged<String?> onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: listItem.firstOrNull!.value,
      onSelected: (String? valueItem) {
        onChanged(valueItem);
      },
      dropdownMenuEntries: listItem,
    );
  }
}

List<DropdownMenuEntry<String>> dropdownMenuDay = [
  DropdownMenuEntry(value: "1", label: "1"),
  DropdownMenuEntry(value: "2", label: "2"),
  DropdownMenuEntry(value: "3", label: "3"),
  DropdownMenuEntry(value: "4", label: "4"),
  DropdownMenuEntry(value: "5", label: "5"),
  DropdownMenuEntry(value: "6", label: "6"),
  DropdownMenuEntry(value: "7", label: "7"),
  DropdownMenuEntry(value: "8", label: "8"),
  DropdownMenuEntry(value: "9", label: "9"),
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
];

class ComboboxDay extends ComboboxApp {
  ComboboxDay({
    super.key,
    required this.onChanged,
  }) : super(
          onChanged: onChanged,
          listItem: dropdownMenuDay,
        );
  final ValueChanged<String?> onChanged;
}

List<DropdownMenuEntry<String>> dropdownMenuMonth = [
  DropdownMenuEntry(value: "1", label: "Thang Gieng"),
  DropdownMenuEntry(value: "2", label: "Thang 2"),
  DropdownMenuEntry(value: "3", label: "Thang 3"),
  DropdownMenuEntry(value: "4", label: "Thang 4"),
  DropdownMenuEntry(value: "5", label: "Thang 5"),
  DropdownMenuEntry(value: "6", label: "Thang 6"),
  DropdownMenuEntry(value: "7", label: "Thang 7"),
  DropdownMenuEntry(value: "8", label: "Thang 8"),
  DropdownMenuEntry(value: "9", label: "Thang 9"),
  DropdownMenuEntry(value: "10", label: "Thang 10"),
  DropdownMenuEntry(value: "11", label: "Thang 11"),
  DropdownMenuEntry(value: "12", label: "Thang Chap"),
];

class ComboboxMonth extends ComboboxApp {
  ComboboxMonth({
    super.key,
    required this.onChanged,
  }) : super(
          onChanged: onChanged,
          listItem: dropdownMenuMonth,
        );
  final ValueChanged<String?> onChanged;
}

List<DropdownMenuEntry<String>> dropdownMenuYear = [
  for (int k = DateTime.now().year + 5; k > DateTime.now().year - 100; k--)
    DropdownMenuEntry(value: k.toString(), label: k.toString()),
];

class ComboboxYear extends ComboboxApp {
  ComboboxYear({
    super.key,
    required this.onChanged,
  }) : super(
          onChanged: onChanged,
          listItem: dropdownMenuYear,
        );
  final ValueChanged<String?> onChanged;
}

List<DropdownMenuEntry<String>> dropdownMenuHoi = [
  DropdownMenuEntry<String>(value: "1 ", label: "Giáp Thìn"),
  DropdownMenuEntry<String>(value: "2 ", label: "Ất Tỵ"),
  DropdownMenuEntry<String>(value: "3 ", label: "Bính Ngọ"),
  DropdownMenuEntry<String>(value: "4 ", label: "Đinh Mùi"),
  DropdownMenuEntry<String>(value: "5 ", label: "Mậu Thân"),
  DropdownMenuEntry<String>(value: "6 ", label: "Kỷ Dậu"),
  DropdownMenuEntry<String>(value: "7 ", label: "Canh Tuất"),
  DropdownMenuEntry<String>(value: "8 ", label: "Tân Hợi"),
  DropdownMenuEntry<String>(value: "9 ", label: "Nhâm Tý"),
  DropdownMenuEntry<String>(value: "10 ", label: "Quý Sửu"),
  DropdownMenuEntry<String>(value: "11 ", label: "Giáp Dần"),
  DropdownMenuEntry<String>(value: "12 ", label: "Ất Mão"),
  DropdownMenuEntry<String>(value: "13 ", label: "Bính Thìn"),
  DropdownMenuEntry<String>(value: "14 ", label: "Đinh Tỵ"),
  DropdownMenuEntry<String>(value: "15 ", label: "Mậu Ngọ"),
  DropdownMenuEntry<String>(value: "16 ", label: "Kỷ Mùi"),
  DropdownMenuEntry<String>(value: "17 ", label: "Canh Thân"),
  DropdownMenuEntry<String>(value: "18 ", label: "Tân Dậu"),
  DropdownMenuEntry<String>(value: "19 ", label: "Nhâm Tuất"),
  DropdownMenuEntry<String>(value: "20 ", label: "Quý Hợi"),
  DropdownMenuEntry<String>(value: "21 ", label: "Giáp Tý"),
  DropdownMenuEntry<String>(value: "22 ", label: "Ất Sửu"),
  DropdownMenuEntry<String>(value: "23 ", label: "Bính Dần"),
  DropdownMenuEntry<String>(value: "24 ", label: "Đinh Mão"),
  DropdownMenuEntry<String>(value: "25 ", label: "Mậu Thìn"),
  DropdownMenuEntry<String>(value: "26 ", label: "Kỷ Tỵ"),
  DropdownMenuEntry<String>(value: "27 ", label: "Canh Ngọ"),
  DropdownMenuEntry<String>(value: "28 ", label: "Tân Mùi"),
  DropdownMenuEntry<String>(value: "29 ", label: "Nhâm Thân"),
  DropdownMenuEntry<String>(value: "30 ", label: "Quý Dậu"),
  DropdownMenuEntry<String>(value: "31 ", label: "Giáp Tuất"),
  DropdownMenuEntry<String>(value: "32 ", label: "Ất Hợi"),
  DropdownMenuEntry<String>(value: "33 ", label: "Bính Tý"),
  DropdownMenuEntry<String>(value: "34 ", label: "Đinh Sửu"),
  DropdownMenuEntry<String>(value: "35 ", label: "Mậu Dần"),
  DropdownMenuEntry<String>(value: "36 ", label: "Kỷ Mão"),
  DropdownMenuEntry<String>(value: "37 ", label: "Canh Thìn"),
  DropdownMenuEntry<String>(value: "38 ", label: "Tân Tỵ"),
  DropdownMenuEntry<String>(value: "39 ", label: "Nhâm Ngọ"),
  DropdownMenuEntry<String>(value: "40 ", label: "Quý Mùi"),
  DropdownMenuEntry<String>(value: "41 ", label: "Giáp Thân"),
  DropdownMenuEntry<String>(value: "42 ", label: "Ất Dậu"),
  DropdownMenuEntry<String>(value: "43 ", label: "Bính Tuất"),
  DropdownMenuEntry<String>(value: "44 ", label: "Đinh Hợi"),
  DropdownMenuEntry<String>(value: "45 ", label: "Mậu Tý"),
  DropdownMenuEntry<String>(value: "46 ", label: "Kỷ Sửu"),
  DropdownMenuEntry<String>(value: "47 ", label: "Canh Dần"),
  DropdownMenuEntry<String>(value: "48 ", label: "Tân Mão"),
  DropdownMenuEntry<String>(value: "49 ", label: "Nhâm Thìn"),
  DropdownMenuEntry<String>(value: "50 ", label: "Quý Tỵ"),
  DropdownMenuEntry<String>(value: "51 ", label: "Giáp Ngọ"),
  DropdownMenuEntry<String>(value: "52 ", label: "Ất Mùi"),
  DropdownMenuEntry<String>(value: "53 ", label: "Bính Thân"),
  DropdownMenuEntry<String>(value: "54 ", label: "Đinh Dậu"),
  DropdownMenuEntry<String>(value: "55 ", label: "Mậu Tuất"),
  DropdownMenuEntry<String>(value: "56 ", label: "Kỷ Hợi"),
  DropdownMenuEntry<String>(value: "57 ", label: "Canh Tý"),
  DropdownMenuEntry<String>(value: "58 ", label: "Tân Sửu"),
  DropdownMenuEntry<String>(value: "59 ", label: "Nhâm Dần"),
  DropdownMenuEntry<String>(value: "60 ", label: "Quý Mão"),
];

class ComboboxHoi extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  const ComboboxHoi({super.key, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropdownMenuHoi[0].value,
      leadingIcon: const Icon(Icons.search),
      label: const Text('Icon'),
      dropdownMenuEntries: dropdownMenuHoi,
      onSelected: (icon) {},
    );
  }
}
