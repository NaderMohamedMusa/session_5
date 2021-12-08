// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:session_5/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  SharedPreferences? prefs;
  int currentIndex = 0;


  logOut()async{
    prefs = await SharedPreferences.getInstance();
    prefs!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Course Flutter",
          style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      /// drawer
      drawer: Container(
        width: MediaQuery.of(context).size.width*0.7,
        color: Colors.teal,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListTile(
                  title: Text("Nader Mohamed",style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold
                      )),
                  subtitle: Text("Nader Mohamed send message .......",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold
                  )),
                  leading: Image.asset(
                    "assets/icons/google.png",
                    width: 35,
                    height: 35,
                  ),
                  trailing: Text("2.30 PM",style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold
                  )),
                  onTap: (){
                    print("Nader mohamed");
                  },
                ),
              ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",
                style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                )),
            ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",
                style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                )),
            ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",
                style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                )),
            ),


            ListTile(
              onTap: (){
                logOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>SplashScreen()));
              },
              leading: Icon(Icons.logout),
              title: Text("Log Out",
                style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                )),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
         check = false;
        },
        child: Icon(Icons.call)
      ),

     /// floatingActionButton with widget
      // floatingActionButton: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     width: double.infinity,
        //     height: 50,
        //     decoration: BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: Center(
        //       child: Text("Apply"),
        //     ),
        //   ),
        // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


     bottomNavigationBar: BottomNavigationBar(
       currentIndex: currentIndex,
       selectedItemColor: Colors.red,
       unselectedItemColor: Colors.grey,
       selectedLabelStyle: TextStyle(
         fontSize: 20,
         color: Colors.grey
       ),
       unselectedLabelStyle: TextStyle(
           fontSize: 20,
           color: Colors.grey
       ),

       items: [
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
             label: "Home"
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
           label: "Basket"
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
           label: "Card"
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
           label: "Favourite"
         ),
       ],

       onTap: (index){
         currentIndex = index;
         setState(() {});
         print(currentIndex);
       },
     ),

      body: changePage(currentIndex)
    );
  }

  Widget changePage(int current){
    switch(current){
      case 0 :
        return SpinKitDoubleBounce(
          color: Colors.yellow,
          size: 100,
          duration: Duration(seconds: 2),
        );
      case 1 :
        return SpinKitFadingFour(
          color: Colors.black,
          size: 100,
        );
      case 2 :
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
        );
      default:
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.yellow,
        );
    }
  }
}