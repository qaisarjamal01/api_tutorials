import 'package:flutter/material.dart';

//here we can clip any widget from any side rounded or something else that has not the functionality on that
//widget like border radius etc.
class Clipping extends StatelessWidget {
  const Clipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip RRect'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
