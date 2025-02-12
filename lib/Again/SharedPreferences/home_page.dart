import 'package:api_tutorial/Again/SharedPreferences/shared_pref_login.dart';
import 'package:api_tutorial/Again/SharedPreferences/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home,size: 100,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async{

                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.KEYLOGIN, false);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SharedPrefLogin()));
              }, child: Text('Logout')),
            )
          ],
        ),
      ),
    );
  }
}
