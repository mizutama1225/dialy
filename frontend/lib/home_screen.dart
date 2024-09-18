
import 'package:dialy/models/dialy.dart';
import 'package:flutter/material.dart';
import 'package:dialy/dialy_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(context) {
    return (MaterialApp(
        home: Scaffold(
            body: Container(
              child: DialyList(dialies: [
                Dialy(userName: "user1", dialyText: "aaa"),
                Dialy(userName: "user2", dialyText: "bbb"),
                Dialy(userName: "user3", dialyText: "ccc"),
              ]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "アカウント"),
                BottomNavigationBarItem(icon: Icon(Icons.edit), label: "かきこむ"),
                BottomNavigationBarItem(icon: Icon(Icons.email), label: "閲覧"),
                BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "履歴"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "設定"),
              ],
            ))));
  }
}
