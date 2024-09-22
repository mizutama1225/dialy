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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "アカウント"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "かきこむ"),
            BottomNavigationBarItem(icon: Icon(Icons.email), label: "閲覧"),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "履歴"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
        ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height:60,
              child:
                TextButton.icon(
                    icon: Icon(Icons.account_circle),
                    label:
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('アカウント設定', style:TextStyle(fontSize:20)),
                    ),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountSettingPage()),
                  );
                },
                )
            ),

            SizedBox(
              width: double.infinity,
              height:60,
              child:
              TextButton.icon(
                icon: Icon(Icons.verified_user),
                label:
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text('プライバシー設定', style:TextStyle(fontSize:20),textAlign: TextAlign.left),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacySettingPage()),
                  );
                },
              )
            ),
            SizedBox(
                width: double.infinity,
                height:60,
                child:
                TextButton.icon(
                  icon: Icon(Icons.help),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('ヘルプ', style:TextStyle(fontSize:20),textAlign: TextAlign.left),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpPage()),
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