import 'package:flutter/material.dart';

class HeroDetails extends StatelessWidget {
  const HeroDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(child: Hero(tag: 'background', child: Image.asset('assets/images/Qaisar.jpg'))),
    );
  }
}
