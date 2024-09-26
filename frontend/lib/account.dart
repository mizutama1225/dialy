import 'package:flutter/material.dart';
import 'package:dialy/main.dart';
import 'IconImageSetting.dart';
import 'background.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = "loading...";
  String icon = "loading...";
  int followingCount = 10;  // フォロー中の数を固定
  int followerCount = 10;   // フォロワーの数を固定

  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }

  Future<void> fetchAccountData() async {
    final response = await http.get(Uri.parse('http://localhost:80/profiles/${USERID}/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        username = data['username'];
        icon = data['icon']; // iconはURLの形式で取得
      });
    } else {
      // エラーハンドリング
      throw Exception('Failed to load account data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
          childWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IconImageSettingPage(title: '',)),
                        );
                      },
                      child: Container(
                        width:100,
                        height:100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: icon == "loading..." ? AssetImage('image/SNS_Icon.jpg') : NetworkImage(icon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50,),
                    Text(username, style: const TextStyle(fontSize: 20)), // ここにデータベースから取得したユーザーネームを表示
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('フォロー中　'),
                    Text(followingCount.toString(), style: const TextStyle(fontSize: 20)), // フォロー中の数は固定
                    const SizedBox(width: 30,),
                    const Text('フォロワー　'),
                    Text(followerCount.toString(), style: const TextStyle(fontSize: 20)), // フォロワー数は固定
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
