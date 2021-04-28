import 'package:flutter/material.dart';
import 'package:rma_lv3_bird_counting_app/locators.dart';
import 'package:rma_lv3_bird_counting_app/ui/home_screen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bird Counter',
      home: HomeScreen(),
    );
  }
}
