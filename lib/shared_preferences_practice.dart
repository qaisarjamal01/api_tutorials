import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPractice extends StatefulWidget {
  const SharedPreferencesPractice({super.key});

  @override
  State<SharedPreferencesPractice> createState() => _SharedPreferencesPracticeState();
}

class _SharedPreferencesPracticeState extends State<SharedPreferencesPractice> {
  // int age = 40;
  // String name = 'Qaisar';
  //
  // // Function to update age and name
  // void updateValues() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // Save new values in SharedPreferences
  //   sharedPreferences.setInt('age', 23);
  //   sharedPreferences.setString('name', 'Yasir');
  //
  //   // Retrieve updated values
  //   int? updatedAge = sharedPreferences.getInt('age');
  //   String? updatedName = sharedPreferences.getString('name');
  //
  //   // Update the state with new values
  //   setState(() {
  //     age = updatedAge ?? age; // If null, keep the old value
  //     name = updatedName ?? name; // If null, keep the old value
  //   });
  //
  //   print('Age and Name updated successfully');
  // }
  @override
  Widget build(BuildContext context) {
    int age = 40;
    String name = 'Qaisar';
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My name is $name',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('My age is $age',style: TextStyle(color: Colors.white,fontSize: 20),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setInt('age', 23);
        sharedPreferences.setString('name', 'yasir');
        print('age saved successfully');
        print('name saved successfully');
        print(sharedPreferences.getInt('age'));
        print(sharedPreferences.getString('name'));
      },
      child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
