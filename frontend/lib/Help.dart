import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Center(
        child: Column(
          children:[
            SizedBox(
              height:30,
            ),
            Text('問題を報告'),
          ]
        ),
      ),


      ));
  }
}