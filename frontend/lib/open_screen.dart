import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 35,
              ),
              Text("{ユーザー名}さんからの日記",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 125, 118)),
              width: 300,
              height: 450,
              child: const Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child:Text(
                      '今日は歯医者に行った',
                      style: TextStyle(fontSize: 15),
                  )
              ),
        ),
        ),
      ],
    );
  }
}
