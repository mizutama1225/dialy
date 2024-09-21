import 'package:flutter/material.dart';
import 'main.dart';
import 'app.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  LoginRequestModel requestModel;

  @override
  void initState(){
    super.initState();
    requestModel = new LoginRequestModel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ログイン'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('メールアドレス'),
            const TextField(
              onCanged: (value){
                email = value;
              },
                decoration:InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'xxx@xxx.com'
                )
            ),
            const Text('パスワード'),
            const TextField(
              onCanged: (value){
                passward = value;
              },
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                )
            ),
            ElevatedButton(
              onPressed: (
                  box_email = email;
                  box_passward = passward;
              ){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text(
                "ログイン",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPost{
  final String email = "";
  final String passward = "";

  LoginPost({
    this.email,
    this.passward,
  });
  Map<String, dynamic> toJson() =>{
    'email': email;
    'passward': passward;
  };
}
