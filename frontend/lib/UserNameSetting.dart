import 'dart:convert';
import 'package:dialy/background.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'AccountSetting.dart';
import 'package:dialy/main.dart';

class UserNameSettingPage extends StatefulWidget {
  @override
  _UserNameSettingPageState createState() => _UserNameSettingPageState();
}

class _UserNameSettingPageState extends State<UserNameSettingPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> updateUsername() async {
    final response = await http.patch(
      Uri.parse('http://localhost:80/profiles/${USERID}/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountSettingPage()),
      );
    } else {
      throw Exception('Failed to update username');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        childWidget: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 80,),
                  const Text('新しいユーザー名を入力してください', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                    onPressed: updateUsername,
                    child: const Text('変更する'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
