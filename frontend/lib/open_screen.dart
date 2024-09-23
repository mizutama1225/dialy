import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 35,
              ),
              Text("{ユーザー名}さんからの日記")
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
              child: const Text(
                '日記の内容',
                style: TextStyle(fontSize: 28),
              )),
        ),
      ],
    );
  }
}
