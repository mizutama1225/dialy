import 'package:flutter/material.dart';
import 'package:dialy/home_screen.dart';
import 'main.dart';
import 'login.dart';


class SignUpCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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