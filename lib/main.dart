import 'package:flutter/material.dart';
import 'screens/home-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'BalsamiqSans',
      ),
      home: HomeScreen(),
    );
  }
}
