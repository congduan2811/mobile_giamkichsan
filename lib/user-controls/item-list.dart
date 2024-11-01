import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  late String description;
  late String title;

  ItemList({super.key, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
          height: 2,
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.kitchen, color: Colors.green[500]),
                  Text('$title'),
                ],
              ),
              Text(
                '$description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ));
  }
}
