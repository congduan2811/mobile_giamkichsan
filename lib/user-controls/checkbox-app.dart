import 'package:flutter/material.dart';

class CheckboxApp extends StatelessWidget {
  const CheckboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      title: 'Checkbox Sample',
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox Sample')),
        body: const Center(
          child: CheckboxExample(),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? Value) {
          setState(() {
            isChecked = Value!;
            print(isChecked);
          });
        });
  }
}
