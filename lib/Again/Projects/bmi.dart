import 'package:flutter/material.dart';

//BMI means body mass index
class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController inController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController wtController = TextEditingController();

  var result = '';
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                SizedBox(height: 11,),
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Please enter your weight!!'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Please enter your height (in Inches)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Please enter you height (in feet)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var inch = inController.text.toString();
                  var ft = ftController.text.toString();

                  //BMI Calculation
                  if(wt != '' && inch != '' && ft != ''){
                    var iwt = int.parse(wt);
                    var iInch = int.parse(inch);
                    var ift = int.parse(ft);

                    var tInch = (ift * 12) + iInch;
                    var tCm = tInch * 2.54;
                    var tMeter = tCm / 100;

                    var bmi = iwt / (tMeter * tMeter);

                    var message = '';
                    if(bmi > 25){
                      message = "You're OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi < 18){
                      message = "You're UnderWeight!!";
                      bgColor = Colors.red.shade200;
                    }else{
                      message = "You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    }

                    setState(() {
                      result = '$message \nYour BMI: ${bmi.toStringAsFixed(2)}';
                    });
                  }else{
                    setState(() {
                      result = 'Please fill the above all fields!!';
                    });
                  }

                }, child: Text('Calculate',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),
                SizedBox(height: 11,),
                Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
