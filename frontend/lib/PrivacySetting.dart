import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting.dart';
import 'MailSetting.dart';

class PrivacySettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('プライバシー設定'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                height:60,
                child:
                TextButton.icon(
                  icon: Icon(Icons.lock),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('パスワードを変更する', style:TextStyle(fontSize:20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordSettingPage()),
                    );
                  },
                )
            ),
            SizedBox(
                width: double.infinity,
                height:60,
                child:
                TextButton.icon(
                  icon: Icon(Icons.mail),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('メールアドレスを変更する', style:TextStyle(fontSize:20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MailSettingPage()),
                    );
                  },
                )
            ),





          ],
        ),
      ),
    );
  }
}