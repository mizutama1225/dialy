import 'package:flutter/material.dart';
import 'main.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('OPEN'),
      ),
      body: const Column(
        children: [
          Text('アカウント名'),

        ],
      ),
    );
  }
}