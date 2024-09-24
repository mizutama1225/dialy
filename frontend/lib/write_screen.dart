import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dialy/appBarGradiant.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("新規日記作成"),
      ),
      body: Column(
        children: [
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
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(93, 224, 230, 1),
                  Color.fromRGBO(0, 74, 173, 1)
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                ),
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: sendDialy,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: const SizedBox(
                    width: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '送信',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
