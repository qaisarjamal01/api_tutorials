import 'package:flutter/material.dart';

//tap on visible and tap for invisible
class AnimatedOpaciti extends StatefulWidget {
  const AnimatedOpaciti({super.key});

  @override
  State<AnimatedOpaciti> createState() => _AnimatedOpacitiState();
}

class _AnimatedOpacitiState extends State<AnimatedOpaciti> {
  var _width = 200.0;
  var _height = 100.0;

  var myOpacity = 1.0;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              curve: Curves.bounceInOut,
              opacity: myOpacity, duration: Duration(seconds: 2),
              child: Container(
                width: _width,
                height: _height,
                color: Colors.red,
              ),),
            ElevatedButton(onPressed: (){
              setState(() {
                if(isVisible){
                  myOpacity = 1.0;
                  isVisible = false;
                }else{
                  myOpacity = 0.0;
                  isVisible = true;
                }

              });
            }, child: Text('Close')
            )],
        ),
      ),
    );
  }
}
