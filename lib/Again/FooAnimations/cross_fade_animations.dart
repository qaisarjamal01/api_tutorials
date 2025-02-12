import 'package:flutter/material.dart';

//in this we take two containers or widgets and toggling with different types of animations with
//timer as well as on button
class CrossFadeAnimations extends StatefulWidget {
  const CrossFadeAnimations({super.key});

  @override
  State<CrossFadeAnimations> createState() => _CrossFadeAnimationsState();
}

class _CrossFadeAnimationsState extends State<CrossFadeAnimations> {
  bool isFirst = true;
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 4), (){
    //   reload();
    // });
  }

  void reload(){
    setState(() {
      if(isFirst){
        isFirst = false;
      }else{
        isFirst = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cross Fade Animations'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              //sizeCurve: Curves.bounceInOut,
                firstCurve: Curves.bounceOut,
                secondCurve: Curves.bounceOut,
                firstChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
                crossFadeState: isFirst? CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: const Duration(seconds: 2)),
            ElevatedButton(onPressed: (){
              reload();
            }, child: const Text('Show'))
          ],
        ),
      ),
    );
  }
}
