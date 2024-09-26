import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key, required this.user});
  final Dialy user;

  @override
  State<UserHistory> createState() {
    return _UserHistoryState();
  }
}

class _UserHistoryState extends State<UserHistory> {
  int dialyIndex = 0;

  // 日付フォーマット用
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    // ロケールデータを初期化
    initializeDateFormatting('ja').then((_) {
      setState(() {
        dateFormat = DateFormat.yMMMd('ja');
      });
    });
  }

  void _incrementIndex() {
    if (dialyIndex < widget.user.contents.length - 1) {
      setState(() {
        dialyIndex++;
      });
    }
  }

  void _decrementIndex() {
    if (dialyIndex > 0) {
      setState(() {
        dialyIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("戻る"),
      ),
      body: Background(childWidget:
        dateFormat == null // ロケールデータが初期化されるまで待つ
          ? const Center(child: CircularProgressIndicator())
          : Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                          CircleAvatar(
                            backgroundImage: widget.user.imageUrl.isNotEmpty
                                ? NetworkImage("http://localhost:80/" + widget.user.imageUrl)
                                : const AssetImage('image/SNS_Icon.jpg')
                                    as ImageProvider,
                            radius: 30,
                      ),
                      Text(
                        widget.user.userName,
                        style: TextStyle(
                            color: dialyIndex % 2 == 0
                                ? Colors.red
                                : Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                          const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          const Text(
                            "あなた",
                            style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 233, 125, 118)),
                  width: 300,
                  height: 450,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            dateFormat.format(widget.user.dates[dialyIndex]),
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.user.contents[dialyIndex],
                            style: const TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: _decrementIndex,
                    icon: Icon(
                      Icons.arrow_back,
                      color: dialyIndex > 0 ? Colors.black87 : Colors.black38,
                    )),
                    Text("${dialyIndex + 1}/${widget.user.contents.length}"),
                IconButton(
                    onPressed: _incrementIndex,
                    icon: Icon(
                      Icons.arrow_forward,
                          color: dialyIndex < widget.user.contents.length - 1
                          ? Colors.black87
                          : Colors.black38,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
