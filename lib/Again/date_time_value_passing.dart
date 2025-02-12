import 'package:flutter/material.dart';

class Practice4 extends StatefulWidget {
  final DateTime? date;
  final TimeOfDay? time;
   Practice4({super.key,required this.time,required this.date});

  @override
  State<Practice4> createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = widget.date != null? '${widget.date!.year}:${widget.date!.month}:${widget.date!.day}':'No date Selected';
    String formattedTime = widget.time != null? '${widget.time!.hour}:${widget.time!.minute}':'No time Selected';
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Container(
          width: 200,
          height: 100,
          child: Text('hello World! $formattedTime $formattedDate',style: TextStyle(fontSize: 22),))
    );
  }
}

//Rich Text
// Center(
//         child: RichText(text: TextSpan(
//           style: TextStyle(
//             fontSize: 21,
//             color: Colors.black
//           ),
//           children: [
//             TextSpan(text: 'Hello '),
//             TextSpan(text: 'World!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.blue)),
//             TextSpan(text: 'welcome to'),
//             TextSpan(text: ' Flutter',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue)),
//
//           ]
//         )),
//       )

//Wrap Widget
//Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Wrap(
//           direction: Axis.horizontal,
//           spacing: 11,
//           runSpacing: 11,
//           alignment: WrapAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.red,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.yellow,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.yellowAccent,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.brown,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.greenAccent,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blueGrey,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.redAccent,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.grey,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//           ],
//         ),
//       ),


//SizedBox
//Wrap(
//         direction: Axis.vertical,
//         children:[
//           SizedBox.square(
//             dimension: 100,
//             child: ElevatedButton(onPressed: (){
//
//             }, style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                 )
//             ), child: Text('Click')),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox.square(
//             dimension: 100,
//             child: ElevatedButton(onPressed: (){
//
//             }, style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                 )
//             ), child: Text('Click')),
//           )
//         ]
//       ),