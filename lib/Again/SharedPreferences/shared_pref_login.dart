import 'package:api_tutorial/Again/SharedPreferences/home_page.dart';
import 'package:api_tutorial/Again/SharedPreferences/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//In this we have used shared preference login functionality that how you can navigate directly to homepage
//after once login without showing this login page, Here in this page we use the set functionality of shared
//preferences and in splash screen we use the get functionality.
//Here i use three pages for this practice splash screen,this login page and home page.

class SharedPrefLogin extends StatefulWidget {
  const SharedPrefLogin({super.key});

  @override
  State<SharedPrefLogin> createState() => _SharedPrefLoginState();
}

class _SharedPrefLoginState extends State<SharedPrefLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Enter your name'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3,
                    style: BorderStyle.solid
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Enter your password'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                        style: BorderStyle.solid
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()async{
                //Successful logged in (credentials are correct)

                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.KEYLOGIN, true);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Container(
                width: 110,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  //shape: BoxShape.circle,
                ),
                child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
