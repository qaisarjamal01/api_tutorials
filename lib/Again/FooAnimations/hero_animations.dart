import 'package:api_tutorial/Again/FooAnimations/hero_details.dart';
import 'package:flutter/material.dart';

class HeroAnimations extends StatelessWidget {
  const HeroAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animations'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Center(child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => HeroDetails()));
              },
              child: Hero(tag: 'background', child: Image.asset('assets/images/Qaisar.jpg',width: 150, height: 100,))))),
    );
  }
}
