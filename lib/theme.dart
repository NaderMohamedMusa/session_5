
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData themeData(){
  return ThemeData(
      hintColor: Colors.teal,
      appBarTheme: AppBarTheme(
        color: Colors.red,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(size: 30,color: Colors.white),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black,
                fontSize: 30
            ),
        ),
      ),

      textTheme: TextTheme(
          headline6: TextStyle(
              fontSize: 30,
              color: Colors.white
          )
      ),
      platform: TargetPlatform.iOS
  );
}