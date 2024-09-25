import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'signup2.dart';
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Center(
        child: Padding(padding: EdgeInsets.only(right: 10,left: 10),
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
            SizedBox(height: 50,),
            const Text('ユーザ名'),
            const TextField(
                decoration:InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                    fillColor: Colors.white70,
                    filled: true,

                )
            ),

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
                  MaterialPageRoute(builder: (context) => SignUpCompletePage()),
                );
              },
              child: const Text(
                "アカウント登録",
              ),
            ),
          ],
        ),
      ),
    )));
  }
}