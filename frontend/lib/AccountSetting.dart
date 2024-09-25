import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'main.dart';
import 'UserNameSetting.dart';
import 'IntroductionSetting.dart';
import 'IconImageSetting.dart';
import 'package:dialy/background.dart';
import 'home_screen.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  String username = "loading...";
  String introduction = "loading...";
  String icon = "loading...";

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
        introduction = data['introduction'];
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
              const Text('アカウント設定', style: TextStyle(fontSize: 30, color: Colors.white),),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text('　　ユーザー名: '),
                  Text(username),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserNameSettingPage()),
                      );
                    },
                    child: const Text("変更"),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('　　自己紹介: '),
                  Text(introduction),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroductionSettingPage()),
                      );
                    },
                    child: const Text("変更"),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('　　プロフィール写真: '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IconImageSettingPage(title: '',)),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: icon == "loading..." ? AssetImage('image/SNS_Icon.jpg') : NetworkImage(icon),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text('ホームに戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
