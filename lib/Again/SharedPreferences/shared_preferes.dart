import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer extends StatefulWidget {
  const SharedPrefer({super.key});

  @override
  State<SharedPrefer> createState() => _SharedPreferState();
}

class _SharedPreferState extends State<SharedPrefer> {

  TextEditingController nameController = TextEditingController();
  static const String KEYNAME = 'name';
  var nameValue = 'No value updated';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared preferences'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: ()async{
              var name = nameController.text.toString();

              var prefs = await SharedPreferences.getInstance();
              prefs.setString(KEYNAME, name);

            }, child: Text('Save',style: TextStyle(fontSize: 20),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(nameValue,style: TextStyle(fontSize: 15),),
          )
        ],
      ),
    );
  }

  void getValue() async{
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    nameValue = getName ?? 'No value updated';
    //nameValue = getName != null? getName: 'No value updated';
    setState(() {

    });
  }
}

