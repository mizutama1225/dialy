import 'package:flutter/material.dart';
import 'main.dart';
import 'AccountSetting.dart';
import 'PrivacySetting.dart';
import 'Help.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('設定'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton.icon(
                  icon: Icon(Icons.account_circle),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('アカウント設定', style: TextStyle(fontSize: 20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountSettingPage()),
                    );
                  },
                )),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton.icon(
                  icon: Icon(Icons.verified_user),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('プライバシー設定',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacySettingPage()),
                    );
                  },
                )),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton.icon(
                  icon: Icon(Icons.help),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('ヘルプ',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpPage()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
