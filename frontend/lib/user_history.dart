import 'package:dialy/main.dart';
import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/background.dart';
import 'dart:convert';
import 'package:dialy/dialy_item.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

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
  Future<List<Dialy>>? _futureDialies;

  @override
  void initState() {
    super.initState();
    // 初期化時にデータを取得
    _futureDialies = fetchDialies();
  }

  // List<String> dialies;

  void _incrementIndex() {
    if (dialyIndex < -1) {
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

  // Future<List<Dialy>> fetchDialies() async {
  //   final response = await http
  //       .get(Uri.parse('http://localhost:8000/users/${USERID}/letters/'));

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     List<Dialy> dialies = data['letters'];

  //     // data.forEach((key, value) {
  //     //   dialies.add(Dialy.fromJson(value));
  //     // });
  //     dialies.add(Dialy.fromJson(data));

  //     return dialies;
  //   } else {
  //     throw Exception('Failed to load dialies');
  //   }
  // }
  Future<List<Dialy>> fetchDialies() async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/users/${USERID}/letters/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      // データのキーを取得
      var userKey = data.keys.first; // ここで最初のキーを取得
      var userData = data[userKey];

      // letters配列を取得
      List<dynamic> letters = userData['letters'];

      // Dialyリストを作成
      List<Dialy> dialies = [];

      // ユーザー情報を保持
      String userName = userData['profile']['username'];

      // 全レターを一つのDialyオブジェクトにまとめる
      dialies.add(Dialy.fromJson(userData));

      return dialies;
    } else {
      throw Exception('Failed to load dialies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("戻る"),
      ),
      body: FutureBuilder(
          // ③FutureBuilderに_dataを渡す
          future: _futureDialies,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              // バックエンドから取得したデータをDialyListに渡す
              // return DialyList(dialies: snapshot.data!);
              List<Dialy> dialies = snapshot.data;
              print(dialies.length);
              return Column(
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
                              color: dialyIndex % 2 == 0
                                  ? Colors.red
                                  : Colors.black,
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
                              color: dialyIndex % 2 == 0
                                  ? Colors.black
                                  : Colors.red,
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
                          dialies[dialyIndex].dialyTexts[0],
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
                            color: dialyIndex > 0
                                ? Colors.black87
                                : Colors.black38,
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
              );
            } else {
              return const Center(child: Text('No data found.'));
            }
          }),
    );
  }
}
