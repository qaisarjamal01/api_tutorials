import 'package:api_tutorial/data/local/db_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String,dynamic>> allNotes = [];
  DBHelper? dbRef;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes()async{
    allNotes = await dbRef!.getAllNotes();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: allNotes.isNotEmpty ? ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (context,index){
        ///notes to be viewed here
          return ListTile(
            //leading: Text(allNotes[index][DBHelper.COLUMN_NOTE_SNO].toString()),
            leading: Text('${allNotes[index][DBHelper.COLUMN_NOTE_SNO]}'),
            title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
            subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
            trailing: SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (){
                        titleController.clear();
                        descController.clear();
                        ///this bottom sheet function is for update
                        showModalBottomSheet(
                          ///it is a high order function because we use call back function in constructor of bottom sheet
                            context: context,
                            builder: (context){
                              titleController.text = allNotes[index][DBHelper.COLUMN_NOTE_TITLE];
                              descController.text = allNotes[index][DBHelper.COLUMN_NOTE_DESC];
                              return getBottomSheetWidget(isUpdate: true,sNo: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                            });
                      },
                      child: Icon(Icons.edit)),
                  InkWell(
                      onTap: ()async{
                        var check = await dbRef!.deleteNote(sNo: allNotes[index][DBHelper.COLUMN_NOTE_SNO]);
                        if(check){
                          getNotes();
                        }
                      },
                      child: Icon(Icons.delete,color: Colors.red,))
                ],
              ),
            ),
          );

      }): Center(
        child: Text('No Notes available',style: TextStyle(fontSize: 20),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        titleController.clear();
        descController.clear();

        ///notes to be added from here

        ///here we give static data
        /*bool check = await dbRef!.addNote(mTitle: 'The name is', mDesc: 'Qaisar Jamal');
        if(check){
          getNotes();
        }*/

        ///and here i provide dynamic data through bottom sheet and stored that in database and also shown on UI
        showModalBottomSheet(
          ///it is a high order function because we use call back function in constructor of bottom sheet
            context: context,
            builder: (context){
              return getBottomSheetWidget();
            });

      },child: Icon(Icons.add),),
    );
  }

  Widget getBottomSheetWidget({bool isUpdate = false,int sNo = 0}){
    return Container(
      padding: EdgeInsets.all(11),
      width: double.infinity,
      child: Column(
        children: [
          Text(isUpdate ? 'Update Note':'Add Note',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 21,),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: 'Enter your title here',
                label: Text('* title'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                )
            ),
          ),
          SizedBox(height: 11,),
          TextField(
            controller: descController,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: 'Enter your desc here',
                label: Text('* desc'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11)
                )
            ),
          ),
          SizedBox(height: 11,),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)
                        )
                    ),
                    onPressed: ()async{
                      var title = titleController.text;
                      var desc = descController.text;

                      if(title.isNotEmpty && desc.isNotEmpty){
                        bool check = isUpdate ? await dbRef!.updateNote(mTitle: title, mDesc: desc, sNo: sNo): await dbRef!.addNote(mTitle: title, mDesc: desc);
                        if(check){
                          getNotes();
                        }
                        Navigator.pop(context);
                      }else{
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the blanks!!')));
                      }
                      titleController.clear();
                      descController.clear();

                    }, child: Text(isUpdate ? 'Update Note':'Add Note',style: TextStyle(fontSize: 15),)),
              ),
              SizedBox(width: 11,),
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)
                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Cancel',style: TextStyle(fontSize: 15),)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
