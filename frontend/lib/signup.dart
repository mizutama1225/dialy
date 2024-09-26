import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'signup2.dart';
import 'package:dialy/home_screen.dart';
import 'package:dialy/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    // リクエストするエンドポイントのURL
    final String url = 'http://localhost:80/users/';

    // リクエストボディ
    final Map<String, String> body = {
      'email': email,
      'password': password,
      "password_confirm": password
    };

    // POSTリクエストを送信
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
            final responseData = jsonDecode(response.body);

      // USERIDをグローバル変数に保存
      USERID = responseData['id'];
        // アカウント登録成功時の処理
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpCompletePage()),
        );
      } else {
        // アカウント登録失敗時の処理
        print('アカウント登録に失敗しました: ${response.body}');
      }
    } catch (e) {
      print('エラーが発生しました: $e');
    }
  }

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
            const Text('メールアドレス'),
            TextField(
              controller: emailController,
                decoration: const InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'xxx@xxx.com',
                    fillColor: Colors.white70,
                    filled: true,
                )
            ),

            const Text('パスワード'),
            TextField(
              controller: passwordController,
                decoration:const InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key),
                    fillColor: Colors.white70,
                    filled: true,
                ),
              obscureText: true,  // パスワード入力を隠す
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: signUp
              ,
              child:
              const Text("アカウント登録"),
            ),
          ],
        ),
      ),
    )));
  }
}
