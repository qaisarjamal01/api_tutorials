import 'package:flutter/material.dart';

//Tween Animation when you animate b/w two points begin and end in this you have provided three components
//1.animation, in this you provided begin and end  2.Controller, in this you provided mixin reference as well
//as duration because without duration animation don't work and controller updates values of animation with
//the help of mixin. 3.Mixin, use single ticker provider with mixin in the homepage.

class TwinAnimations extends StatefulWidget {
  const TwinAnimations({super.key});

  @override
  State<TwinAnimations> createState() => _TwinAnimationsState();
}

class _TwinAnimationsState extends State<TwinAnimations> with SingleTickerProviderStateMixin {

  late Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 4));
    animation = Tween(begin: 200.0,end: 100.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.blue,end: Colors.orange).animate(animationController);

    animationController.addListener((){
      //print(animation.value);
      print(colorAnimation.value);
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }
}