import 'package:dialy/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    // リクエストするエンドポイント
    final String url = 'http://localhost:80/login/login/';

    // リクエストボディ
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    // POSTリクエストを送信
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {


      final responseData = jsonDecode(response.body);

      // USERIDをグローバル変数に保存
      USERID = responseData['id'];
        // ログイン成功時の処理
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // ログイン失敗時の処理
        print('ログインに失敗しました: ${response.body}');
      }
    } catch (e) {
      print('エラーが発生しました: $e');
    }
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
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
                hintText: 'xxx@xxx.com',
              ),
            ),
            const SizedBox(height: 16),
            const Text('パスワード'),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.key),
              ),
              obscureText: true, // パスワード入力を隠す
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: login,
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
