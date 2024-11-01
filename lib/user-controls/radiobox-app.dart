import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RadioboxApp extends StatelessWidget {
  const RadioboxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radio box",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lua chon'),
        ),
        body: RadioBoxHome(),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class RadioBoxHome extends StatefulWidget {
  const RadioBoxHome({super.key});

  @override
  State<RadioBoxHome> createState() => _RadioBoxHomeState();
}

class _RadioBoxHomeState extends State<RadioBoxHome> {
  String _character = "";
  @override
  Widget build(BuildContext context) {
    List<String> lstValue = ["1", "2", "3"];
    return Column(
      children: [
        LabeledRadio(
          title: 'Gio hien tai',
          onChanged: (String? value) {
            setState(() {
              _character = value.toString();
            });
          },
          value: lstValue[0],
          groupValue: _character,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
        ),
        LabeledRadio(
          title: 'Gio trong ngay',
          onChanged: (String? value) {
            setState(() {
              _character = value.toString();
            });
          },
          value: lstValue[1],
          groupValue: _character,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Enter your number"),
          keyboardType: TextInputType.datetime,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter
          ], // Only numbers can be entered
        ),
      ],
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.title,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
  });

  final String title;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<String>(
              groupValue: groupValue,
              value: value,
              onChanged: (String? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
