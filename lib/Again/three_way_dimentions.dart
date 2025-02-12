import 'package:flutter/material.dart';

class ThreeWayDimentions extends StatefulWidget {
  const ThreeWayDimentions({super.key});

  @override
  State<ThreeWayDimentions> createState() => _ThreeWayDimentionsState();
}

class _ThreeWayDimentionsState extends State<ThreeWayDimentions> {

  var arrNames = [
    'assets/images/aku.jpg',
    'assets/images/asia.jpg',
    'assets/images/ali.jpg',
    'assets/images/khan.jpg',
    'assets/images/kkk.jpg',
    'assets/images/jjk.jpg',
    'assets/images/jan.jpg',
    'assets/images/asi.jpg',
    'assets/images/has.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ListWheelScrollView(
            itemExtent: 200,
            children: arrNames.map((value) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Center(child: Image.asset('$value',width: double.infinity,)),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  //color: Colors.blue,
                ),
              ),
            )).toList()),
      ),
    );
  }
}
