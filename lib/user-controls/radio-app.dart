import 'package:flutter/material.dart';

class RadioApp extends StatelessWidget {
  const RadioApp({
    super.key,
    required this.title,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 1.0),
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
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
