import 'package:dialy/background.dart';
import 'package:dialy/home_screen.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Center(
        child: Padding(padding: EdgeInsets.only(right: 10,left: 10),
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('アカウント登録画面に切り替える'))],
            ),
            const SizedBox(height: 50,),
            const Text('メールアドレス'),
            const TextField(
                decoration:InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'xxx@xxx.com',
                    fillColor: Colors.white70,
                    filled: true,
                )
            ),
            const SizedBox(height: 20,),
            const Text('パスワード'),
            const TextField(
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  fillColor: Colors.white70,
                  filled: true,
                )
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                "ログイン",
              ),
            ),
          ],
        ),
      ),
    )));
  }
}