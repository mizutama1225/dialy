import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterStyle: TextStyle(),
            ),
            inputFormatters: [LengthLimitingTextInputFormatter(100)],
            maxLines: 10,
            onChanged: (value) {},
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 300),
            child: Container(
              transform: Matrix4.rotationZ(-45 * pi / 180),
              transformAlignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ))
      ],
    );
  }
}
