// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:session_5/homeScreen.dart';
import 'package:session_5/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  bool eye = true;
  late String mail;
  SharedPreferences? pref;

  saveData(String? email,String? password)async{
    pref = await SharedPreferences.getInstance();
    pref!.setString("email", email!);
    pref!.setString("password", password!);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الدخول",
          // style: Theme.of(context).appBarTheme.textTheme!.headline1!.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/nad.png"),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Your mail";
                      }
                      return null;
                    },
                    onChanged: (value){
                      print(value);
                    },
                    onSaved: (value){
                      mail = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your mail",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 5,
                            color: Colors.green),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: password,
                    validator: (value){
                      if(value!.length < 8){
                        return "password less than 8 chara";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: eye,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 5,
                            color: Colors.green),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon:Icon(eye
                            ?  Icons.visibility_off_sharp
                            :  Icons.remove_red_eye
                        ) ,
                        onPressed: (){
                        eye ? eye = false : eye = true;
                        setState(() {});
                      },),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      print("email ==== ${email!.text.toString()}");
                      print("password ==== ${password!.text.toString()}");
                      print(_keyForm.currentState!.validate());

                      if(_keyForm.currentState!.validate()){
                        saveData(email!.text.toString(), password!.text.toString());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      height: 50,
                      child: Center(
                        child: Text("Login",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                            fontSize: 30
                          )
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?  ",
                      style: TextStyle(color: Colors.black,fontSize: 17),),


                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Text("Sign Up",
                        style: TextStyle(color: Colors.teal,fontSize: 16),),
                    ),
                  ],
                ),

                SizedBox(height: 20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: MediaQuery.of(context).size.width*0.43,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Text("OR",
                        style: TextStyle(color: Colors.black,fontSize: 16),),
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: MediaQuery.of(context).size.width*0.43,
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 20,
                        child: Image.asset("assets/icons/facebook.png")
                    ),


                    CircleAvatar(
                        radius: 20,
                        child: Image.asset("assets/icons/twitter.png")
                    ),

                    CircleAvatar(
                        radius: 20,
                        child: Image.asset("assets/icons/google.png")
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
