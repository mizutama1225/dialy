import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
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
                          color:
                              dialyIndex % 2 == 0 ? Colors.red : Colors.black),
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
                          color:
                              dialyIndex % 2 == 0 ? Colors.black : Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 160, 154)),
                width: 250,
                height: 400,
                child: Text(dialies[dialyIndex])),
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
    );
  }
}
