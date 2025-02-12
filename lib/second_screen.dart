import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/currency_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Data>>(
          future: getDataApi(),
          builder: (context,snapshot){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: [
                    Text(snapshot.data![index].id.toString()),
                    Text(snapshot.data![index].name.toString()),
                    Text(snapshot.data![index].minSize.toString()),
                  ],
                )
              );
            });
          }),
    );
  }
  
  Future<List<Data>> getDataApi() async {
    final response = await http.get(Uri.parse('https://api.coinbase.com/v2/currencies'));

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body.toString());
      print(response.body);
      var data = jsonResponse['data'] as List;

      return data.map((item) => Data.fromJson(item)).toList();
    }else{
      throw Exception('error');
    }
  }
}
