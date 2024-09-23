import 'package:flutter/material.dart';
import 'main.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5de0e6),
        title: const Text('ヘルプ'),
      ),
      body: const Center(
        child: Column(
          children:[
            SizedBox(
              height:30,
            ),
            Text('問題を報告'),
          ]
        ),
      ),


      );
  }
}