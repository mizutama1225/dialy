import 'dart:convert';
import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'package:dialy/main.dart';
import 'package:http/http.dart' as http;

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

  // HTTPリクエストを送信する関数
  void sendDialy() async {
    _text = _textController.text;

    // 送信先のURL
    final String url = 'http://localhost:80/writtenletter/';

    // リクエストボディ
    final Map<String, String> body = {
      'user': USERID ?? '',
      'content': _text,
    };

    try {
      // POSTリクエストの送信
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // リクエストが成功した場合
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      } else {
        // リクエストが失敗した場合の処理
        print('送信に失敗しました: ${response.statusCode}');
      }
    } catch (e) {
      // エラーが発生した場合の処理
      print('エラーが発生しました: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Background(childWidget:
    Column(
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
                counterStyle: TextStyle(),
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 233, 212, 118),
                filled: true),
            style: const TextStyle(
              fontSize: 28,
            ),
            controller: _textController,
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
    )));
  }
}
