import 'package:api_tutorial/Again/SharedPreferences/home_page.dart';
import 'package:api_tutorial/Again/SharedPreferences/shared_pref_login.dart';
import 'package:api_tutorial/Again/SharedPreferences/shared_preferes.dart';
import 'package:api_tutorial/Again/SharedPreferences/splash_screen.dart';
import 'package:api_tutorial/Again/ripple_animation.dart';
import 'package:api_tutorial/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}