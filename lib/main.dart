// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:session_5/splashScreen.dart';
import 'package:session_5/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: themeData()
    );
  }
}