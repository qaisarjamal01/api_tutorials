import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostApis extends StatefulWidget {
  const PostApis({super.key});

  @override
  State<PostApis> createState() => _PostApisState();
}

class _PostApisState extends State<PostApis> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  void SignUp(String email, password)async{
    try{
      Response response = await post(Uri.parse('https://reqres.in/api/register'), body:
      {
        'email': email,
        'password': password,
      });
      if(response.statusCode == 200){
        print('User Sign Up');
      }else{
        print('failed');
      }
    }catch (e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'email'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'password'
              ),
            ),
          ),
          InkWell(
            onTap: (){
              SignUp(emailController.text.trim(), passwordController.text.trim());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.red,
                child: Center(child: Text('Sign Up')),
              ),
            ),
          )
        ],
      )
    );
  }
}
