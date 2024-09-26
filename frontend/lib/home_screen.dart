import 'package:dialy/account.dart';
import 'package:dialy/models/dialy.dart';
import 'package:flutter/material.dart';
import 'package:dialy/main.dart';
import 'account.dart';
import 'package:dialy/dialy_list.dart';
import 'package:dialy/write_screen.dart';
import 'package:dialy/open_screen.dart';
import 'package:dialy/setting.dart';
import 'package:dialy/background.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 3;
  bool newDialyArrived = true;
  Future<List<Dialy>>? _futureDialies;

  @override
  void initState() {
    super.initState();
    // 初期化時にデータを取得
    _futureDialies = fetchDialies();
  }

  Future<List<Dialy>> fetchDialies() async {
    final response = await http
        .get(Uri.parse('http://localhost:80/users/${USERID}/letters/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<Dialy> dialies = [];

      data.forEach((key, value) {
        dialies.add(Dialy.fromJson(value));
      });


      return dialies;
    } else {
      throw Exception('Failed to load dialies');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Background(
          childWidget: _selectedIndex == 3
              ? FutureBuilder<List<Dialy>>(
                  future: _futureDialies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // バックエンドから取得したデータをDialyListに渡す
                      return DialyList(dialies: snapshot.data!);
                    } else {
                      return const Center(child: Text('No data found.'));
                    }
                  },
                )
              : _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: badges.Badge(
          showBadge: newDialyArrived,
          badgeContent: const Text(
            '!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(93, 224, 230, 1),
          ),
          child: FloatingActionButton(
            onPressed: () => _onItemTapped(2),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
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
                        style: TextStyle(color: Colors.white),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Color.fromRGBO(93, 224, 230, 1),
                      ),
                      child: Icon(Icons.email),
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
    );
  }

  // 静的ではなくインスタンス変数に変更した _widgetOptions
  final List<Widget> _widgetOptions = <Widget>[
    AccountPage(),
    const WriteScreen(),
    const OpenScreen(),
    const SizedBox(), // FutureBuilder内で処理するのでここは空のウィジェットに
    SettingPage(),
  ];
}
