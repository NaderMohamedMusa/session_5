// ignore_for_file: file_names, prefer_const_constructors, unnecessary_null_in_if_null_operators, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:session_5/homeScreen.dart';
import 'package:session_5/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
   SharedPreferences? prefs;
   String? email;
   String? password;


  @override
  void initState() {
    super.initState();
    getData();
    changePage();
  }


  getData()async{
    prefs = await SharedPreferences.getInstance();
    email = prefs!.getString("email") ?? null;
    password = prefs!.getString("password") ?? null;
    setState(() {});
    print("email ====>>>> ${prefs!.getString("email")}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/splah.png",
        fit: BoxFit.fill,),
    );
  }


  void changePage(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return email == null
            ? LoginScreen()
            : HomeScreen();
      }));
    });
  }

}
