import 'package:flutter/material.dart';

//change the color of the same container with size with animation
class AnimatedContainers extends StatefulWidget {
  const AnimatedContainers({super.key});

  @override
  State<AnimatedContainers> createState() => _AnimatedContainersState();
}

class _AnimatedContainersState extends State<AnimatedContainers> {

  var _width = 200.0;
  var _height = 100.0;

  bool flag = true;
  //Color bgColor = Colors.red;
  Decoration myDec = BoxDecoration(
      color: Colors.red,
    borderRadius: BorderRadius.circular(4)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animations'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                width: _width,
                height: _height,
                curve: Curves.slowMiddle,
                decoration: myDec,
                duration: Duration(seconds: 2)),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              setState(() {
                if(flag){
                  _width = 200.0;
                  _height = 100.0;
                  myDec = BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4)
                  );
                  flag = false;
                }else{
                  _width = 100.0;
                  _height = 200.0;
                  myDec = BoxDecoration(
                      color:  Colors.green,
                    borderRadius: BorderRadius.circular(20)
                  );
                  flag = true;
                }
              });
            }, child: Text('Animate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
