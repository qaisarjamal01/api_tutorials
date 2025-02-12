import 'package:api_tutorial/Database_handler/db_handler.dart';
import 'package:api_tutorial/model/database_model.dart';
import 'package:flutter/material.dart';

class DbTextFields extends StatefulWidget {
  const DbTextFields({super.key});

  @override
  State<DbTextFields> createState() => _DbTextFieldsState();
}

class _DbTextFieldsState extends State<DbTextFields> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

@override
  void dispose() {
  idController.dispose();
  nameController.dispose();
  ageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    hintText: 'id',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: 'age',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  var idText = idController.text;
                  var id = int.tryParse(idText);
                  var ageText = ageController.text;
                  var age = int.tryParse(ageText);
                  DatabaseHandler().insertData(DatabaseModel(id: id!, name: nameController.text, age: age!));
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Insert',style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  DatabaseHandler().readData();
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Read',style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  var idText = idController.text;
                  var id = int.tryParse(idText);
                  //DatabaseHandler().deleteData(id!);
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Delete',style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  var idText = idController.text;
                  var id = int.tryParse(idText);
                  var ageText = ageController.text;
                  var age = int.tryParse(ageText);
                  // DatabaseHandler().updateData(id!, {
                  //   'name': nameController.text,
                  //   'age': age,
                  // });
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}