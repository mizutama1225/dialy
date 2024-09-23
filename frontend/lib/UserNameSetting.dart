import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting2.dart';
import 'AccountSetting.dart';

class UserNameSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5de0e6),
        title: const Text('ユーザー名変更'),
      ),
      body: Column(
        children: [
          Center(
              child:Column(
                children:[
                  const SizedBox(height:20,),
                  const Text('新しいユーザー名を入力してください', style:TextStyle(fontSize:15)),
                  const SizedBox(height:20,),
                  const TextField(
                      decoration:InputDecoration(
                        border:OutlineInputBorder(),
                      )
                  ),
                  const SizedBox(height:50,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountSettingPage()),
                    );
                  },
                    child: const Text('変更する'),)
                ],
              )

          )


        ],
      ),
    );
  }
}