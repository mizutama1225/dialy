import 'package:dialy/AccountSetting.dart';
import 'package:dialy/models/dialy.dart';
import 'package:flutter/material.dart';
import 'package:dialy/dialy_list.dart';
import 'package:dialy/write_screen.dart';
import 'package:dialy/open_screen.dart';
import 'package:dialy/setting.dart';
import 'package:dialy/background.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 3;
  bool newDialyArrived = true;

  static final List<Widget> _widgetOptions = <Widget>[
    AccountSettingPage(),
    const WriteScreen(),
    const OpenScreen(),
    DialyList(dialies: [
      Dialy(
        userName: "ユーザー1",
        dialyText: "aaa",
        updatedDate: DateTime(10, 9, 21),
      ),
      Dialy(
        userName: "ユーザー2",
        dialyText: "bbb",
        updatedDate: DateTime(10, 9, 20),
      ),
      Dialy(
        userName: "ユーザー3",
        dialyText: "ccc",
        updatedDate: DateTime(10, 9, 19),
      ),
    ]),
    SettingPage(),
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
        body: Background(
          childWidget: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "アカウント"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: "かきこむ"),
            BottomNavigationBarItem(
              icon: newDialyArrived
                  ? const badges.Badge(
                      badgeContent: Text(
                        '!',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Color.fromRGBO(93, 224, 230, 1),
                      ),
                      child: Icon(
                        Icons.email,
                        size: 35,
                      ),
                    )
                  : const Icon(Icons.email),
              label: "閲覧",
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "履歴"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "設定"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromRGBO(0, 74, 173, 1),
        ),
      ),
    ));
  }
}
