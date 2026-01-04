import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';

class Alert1 extends StatefulWidget {
  const Alert1({super.key});

  @override
  State<Alert1> createState() => _Alert1State();
}

class _Alert1State extends State<Alert1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: UiColor.black60Per,
      child: Center(child: Text('This is an alert!')),
    );
  }
}
