import 'dart:async';
import 'package:api_tutorial/Again/SharedPreferences/home_page.dart';
import 'package:api_tutorial/Again/SharedPreferences/shared_pref_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = 'login';

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(child: Icon(Icons.account_circle,size: 100,)),
    );
  }

  void getValue() async{
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), (){
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SharedPrefLogin()));
        }
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SharedPrefLogin()));
      }
    });
  }
}