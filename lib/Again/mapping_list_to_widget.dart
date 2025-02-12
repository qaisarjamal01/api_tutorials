import 'package:flutter/material.dart';

//Mapping List to Widget
class MappingListToWidget extends StatelessWidget {
  //var arrData = [1,2,45,6,4,3,3];
  var arrData = [
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': 4
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    {
      'name': 'Rahul',
      'mblno': '9348934839',
      'number': '4'
    },
    
  ];
   MappingListToWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapping List to Widget'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: arrData.map((value) => 
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(value['name'].toString()),
                subtitle: Text(value['mblno'].toString()),
                trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange,
                    child: Text(value['number'].toString())),
              )
          //     Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.blue.shade200,
          //       borderRadius: BorderRadius.circular(22)
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(child: Text('$value')),
          //     ),
          //   ),
          // )
          ).toList(),
        ),
      ),
    );
  }
}
