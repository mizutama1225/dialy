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
              onCanged: (input) => requestModel.emailAddress = input,
                decoration:InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'xxx@xxx.com'
                )
            ),
            const Text('パスワード'),
            const TextField(
              onCanged: (input) => requestModel.password = input,
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                )
            ),
            ElevatedButton(
              onPressed:(){
                if(validateAndSave()){
                  print(requestModel.toJson());
                }
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

  bool validateAndSave() {
    final form = globalFormKey.currenState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }
}
