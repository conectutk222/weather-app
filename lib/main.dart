import 'package:flutter/material.dart';
import 'backend/getweatherdata.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: lodingscreen()
    );
  }
}

