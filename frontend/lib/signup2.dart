import 'package:dialy/background.dart';
import 'package:dialy/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dialy/home_screen.dart';
import 'main.dart';
import 'login.dart';


class SignUpCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
        Center(
        child: Padding(padding: EdgeInsets.only(left:10,right:10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                    child: Text('ログイン画面に切り替える'))],
              ),
              const Text('あなたのメールアドレスに4桁の認証番号を送りました'),
              const SizedBox(height: 20,),
              const TextField(
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  hintText:'4桁の認証番号',
                  fillColor: Colors.white70,
                  filled: true,
                )
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text(
                  "認証",
                ),
              ),
            ],
        ),
      ),
    )));
  }
}