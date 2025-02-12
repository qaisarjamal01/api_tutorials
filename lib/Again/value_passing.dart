import 'package:flutter/material.dart';

class Practice5 extends StatefulWidget {
  final nameFromScreen;
   Practice5({super.key,required this.nameFromScreen});

  @override
  State<Practice5> createState() => _Practice5State();
}

class _Practice5State extends State<Practice5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome ${widget.nameFromScreen}',style: TextStyle(fontSize: 20),),
          )
        ],
      ),
    );
  }
}
