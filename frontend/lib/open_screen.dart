import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 160, 154)),
              width: 250,
              height: 400,
              child: const Text('日記の内容')),
        ),
      ],
    );
  }
}
