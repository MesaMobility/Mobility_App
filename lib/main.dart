import 'package:flutter/material.dart';
import 'package:mobility_appa/pages/MainPage.dart';

void main() => runApp(MobilityApp());

class MobilityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}