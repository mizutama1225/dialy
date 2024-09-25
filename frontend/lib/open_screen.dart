import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});
  @override
  State<OpenScreen> createState() {
    return _OpenScreenState();
  }
}

class _OpenScreenState extends State<OpenScreen> {
  int dialyIndex = 0;

  List<Dialy> newDialies = [
    Dialy(
        userName: "ユーザー1",
        dialyTexts: ["はじめまして--------"],
        updatedDate: DateTime(10, 10, 10)),
    Dialy(
        userName: "ユーザー2",
        dialyTexts: ["こんにちは--------"],
        updatedDate: DateTime(10, 10, 10)),
    Dialy(
        userName: "ユーザー3",
        dialyTexts: ["Hello--------"],
        updatedDate: DateTime(10, 10, 10)),
  ];

  void _incrementIndex() {
    if (dialyIndex < newDialies.length - 1) {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 35,
              ),
              Text("${newDialies[dialyIndex].userName}さんからの日記")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 125, 118)),
              width: 300,
              height: 450,
              child: Text(
                newDialies[dialyIndex].dialyTexts[0],
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
            Text("${dialyIndex + 1}/${newDialies.length}"),
            IconButton(
                onPressed: _incrementIndex,
                icon: Icon(
                  Icons.arrow_forward,
                  color: dialyIndex < newDialies.length - 1
                      ? Colors.black87
                      : Colors.black38,
                )),
          ],
        )
      ],
    );
  }
}
