import 'dart:convert';
import 'package:dialy/background.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'AccountSetting.dart';
import 'package:dialy/main.dart';

class IntroductionSettingPage extends StatefulWidget {
  @override
  _IntroductionSettingPageState createState() => _IntroductionSettingPageState();
}

class _IntroductionSettingPageState extends State<IntroductionSettingPage> {
  final TextEditingController _introductionController = TextEditingController();

  Future<void> updateIntroduction() async {
    final response = await http.patch(
      Uri.parse('http://localhost:80/profiles/${USERID}/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'introduction': _introductionController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountSettingPage()),
      );
    } else {
      throw Exception('Failed to update introduction');
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
                  const Text('新しい自己紹介を入力してください', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _introductionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                    onPressed: updateIntroduction,
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
