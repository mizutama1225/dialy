import 'package:dialy/home_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';
import 'home_screen.dart';


class SignUpCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5de0e6),
        title: const Text('メールアドレス認証'),
    ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ただいまあなたのメールアドレスに4桁の認証番号を送りました'),
              const TextField(
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  hintText:'4桁の認証番号',
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
                  "認証",
                ),
              ),
            ],
        ),
      ),
    );
  }
}