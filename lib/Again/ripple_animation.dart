import 'package:flutter/material.dart';

//Ripple Animation is like a rainbow or when you tap on button or when you throw something in water then the
//effect made in water in waves form is called Ripple effect.
//In this animation we need three components. 1.Multiple Circles, 2.These circles grow with value which gives
//animation controller, 3.Give the color opacity like grow with value from darker to lower or finish.
//but we can start up from tween animation.

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with SingleTickerProviderStateMixin{

  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0,200.0,250.0,300.0,350.0];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 4),lowerBound: 0.5);
    //_animation = Tween(begin: 0.0,end: 1.0).animate(_animationController);

    _animationController.addListener((){
      print(_animationController.value);
      setState(() {

      });
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripple Effect'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildMyContainer(listRadius[0]),
            buildMyContainer(listRadius[1]),
            buildMyContainer(listRadius[2]),
            buildMyContainer(listRadius[3]),
            buildMyContainer(listRadius[4]),
            Icon(Icons.add,size: 50,),
          ]
        ),
        // child: Stack(
        //   alignment: Alignment.center,
        //   children: listRadius.map((radius) => Container(
        //     width: radius * _animationController.value,
        //     height: radius * _animationController.value,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.blue.withOpacity(1.0 - _animationController.value)
        //     ),
        //   )).toList(),
        // ),
      ),
    );
  }

  Widget buildMyContainer(radius){
    return Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(1.0 - _animationController.value)
      ),
    );
  }
}