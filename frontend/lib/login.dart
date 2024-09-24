import 'package:flutter/material.dart';
import 'main.dart';
import 'home_screen.dart';

class LogInPage extends StatelessWidget {
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
                decoration:InputDecoration(
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'xxx@xxx.com'
                )
            ),
            const Text('パスワード'),
            const TextField(
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),

                )
            ),
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
    );
  }
}