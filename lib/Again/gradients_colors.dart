import 'package:flutter/material.dart';

class GradientsColors extends StatelessWidget {
   GradientsColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Color(0xffffffff),
            Color(0xff000000),
          ],
          center: Alignment.bottomLeft,
            stops: [0.0,1.0]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text('Please enter your weight!!'),
                  prefixIcon: Icon(Icons.line_weight)
              ),
            ),
            SizedBox(height: 11,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text('Please enter your height (in Inches)'),
                  prefixIcon: Icon(Icons.height)
              ),
            ),
            SizedBox(height: 11,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text('Please enter you height (in feet)'),
                  prefixIcon: Icon(Icons.height)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
