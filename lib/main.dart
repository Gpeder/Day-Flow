import 'package:dayflow/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DayApp());
}

class DayApp extends StatelessWidget {
  const DayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Flow',
      home: HomePage(),
    );
  }
}
