import 'package:dialy/models/dialy.dart';
import 'package:flutter/material.dart';
import 'package:dialy/dialy_list.dart';
import 'package:dialy/write_screen.dart';
import 'package:dialy/open_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 3;

  static final List<Widget> _widgetOptions = <Widget>[
    const Text("Account"),
    const WriteScreen(),
    const OpenScreen(),
    DialyList(dialies: [
      Dialy(userName: "ユーザー1", dialyText: "aaa"),
      Dialy(userName: "ユーザー2", dialyText: "bbb"),
      Dialy(userName: "ユーザー3", dialyText: "ccc"),
    ]),
    const Text("setting"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    return (MaterialApp(
      home: Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "アカウント"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "かきこむ"),
            BottomNavigationBarItem(icon: Icon(Icons.email), label: "閲覧"),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "履歴"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    ));
  }
}
