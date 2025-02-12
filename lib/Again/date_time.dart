import 'package:api_tutorial/Again/date_time_value_passing.dart';
import 'package:api_tutorial/Again/value_passing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Practice3 extends StatefulWidget {
  const Practice3({super.key});

  @override
  State<Practice3> createState() => _Practice3State();
}

class _Practice3State extends State<Practice3> {
  DateTime? datePicked;
  TimeOfDay? timePicked;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var arrNames = ['saim','zafar','rahim','afridi','raj','ham','name'];
    //var time = DateTime.now();

    return Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
                //Text('Current Date: ${DateFormat('QQQQ').format(time)}'),
                ElevatedButton(onPressed: () async {
                   datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2025));
                  if(datePicked != null){
                    setState(() {

                    });
                  }
                  
                  //print('Time Selected: ${time.month}: ${time.year}: ${time.day}');
                }, child: Text('Show Date')),
                ElevatedButton(onPressed: () async {
                  timePicked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input,
                  );
                  if(timePicked != null){
                    setState(() {

                    });
                  }
                  //print('Time Selected: ${time.month}: ${time.year}: ${time.day}');
                }, child: Text('Show Time')),
                Text('Date Selected: ${datePicked != null? DateFormat('yyyy-MM-dd').format(datePicked!): 'None'}'),
                Text('Time Selected: ${timePicked != null? '${timePicked!.hour}: ${timePicked!.minute}':'None'}'),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Practice4(
                    date: datePicked,
                    time: timePicked,
                  )));
                }, child: Text('Next')),
                TextField(
                  controller: nameController,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Practice5(
                    nameFromScreen: nameController.text.toString(),
                  )));
                }, child: Text('Next')
                ) ],
            ),
          ),
        )
    );
  }
}