import 'package:flutter/material.dart';

class DateControl extends StatelessWidget {
  const DateControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Date",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Datepicker(),
    );
  }
}

class Datepicker extends StatefulWidget {
  const Datepicker({super.key});

  @override
  State<Datepicker> createState() => _StatefulWidgetState();
}

class _StatefulWidgetState extends State<Datepicker> {
  DateTime? picker;
  final TextEditingController _dateController = TextEditingController();
  Future<void> _SelectDate() async {
    picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picker != null) {
      setState(() {
        _dateController.text = picker.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _dateController,
        decoration: InputDecoration(
          labelText: 'Date',
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        ),
        readOnly: true,
        onTap: () {
          _SelectDate();
        },
      ),
    );
  }
}
