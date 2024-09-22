import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  var _textController = TextEditingController();
  var _text = "";
  bool enableButton = false;

  final _snackBar = const SnackBar(content: Text("日記を送信しました"));
  void sendDialy() {
    _text = _textController.text;
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            '新規日記作成',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
          child: TextField(
            decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                counterStyle: TextStyle(),
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 233, 212, 118),
                filled: true),
            style: const TextStyle(
              fontSize: 28,
            ),
            controller: _textController,
            // inputFormatters: [LengthLimitingTextInputFormatter(100)],
            maxLength: 100,
            maxLines: 10,
            onChanged: (value) {
              setState(() {
                value == "" ? enableButton = false : enableButton = true;
              });
            },
          ),
        ),
        ElevatedButton.icon(
          label: Text(
            "送信",
            style: TextStyle(
                color: enableButton
                    ? const Color.fromRGBO(93, 224, 230, 1)
                    : const Color.fromRGBO(89, 118, 121, 1)),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              // side: const BorderSide(color: Colors.white),
            ),
          ),
          onPressed: enableButton ? sendDialy : null,
          icon: Icon(
            Icons.send,
            color: enableButton
                ? const Color.fromRGBO(93, 224, 230, 1)
                : const Color.fromRGBO(89, 118, 121, 1),
          ),
        )
      ],
    );
  }
}
