import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/background.dart';

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

  List<String> dialies = ["日記1\naaaa", "日記2\nbbb", "日記3\nccc"];

  void _incrementIndex() {
    if (dialyIndex < dialies.length - 1) {
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
      body: Background(
        childWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: dialyIndex % 2 == 0 ? Colors.red : Colors.black,
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
                      Icon(
                        Icons.person,
                        color: dialyIndex % 2 == 0 ? Colors.black : Colors.red,
                      ),
                      Text(
                        "あなた",
                        style: TextStyle(
                            color: dialyIndex % 2 == 0
                                ? Colors.black
                                : Colors.red),
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
                  child: Text(
                    dialies[dialyIndex],
                    style: const TextStyle(fontSize: 28),
                  )),
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
                Text("${dialyIndex + 1}/${dialies.length}"),
                IconButton(
                    onPressed: _incrementIndex,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: dialyIndex < dialies.length - 1
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