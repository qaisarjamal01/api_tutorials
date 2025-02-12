import 'package:flutter/material.dart';

class Practice6 extends StatefulWidget {
  const Practice6({super.key});

  @override
  State<Practice6> createState() => _Practice6State();
}

class _Practice6State extends State<Practice6> {
  RangeValues values = RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Range Sliders'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: RangeSlider(
        min: 0,
          max: 100,
          values: values,
          labels: labels,
          activeColor: Colors.red,
          inactiveColor: Colors.red.shade100,
          divisions: 20,
          onChanged: (newValue){
            values = newValue;
            print('${newValue.start} : ${newValue.end}');
            setState(() {

            });
      }),
    );
  }
}
