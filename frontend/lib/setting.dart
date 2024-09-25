import 'package:flutter/material.dart';
import 'main.dart';
import 'AccountSetting.dart';
import 'PrivacySetting.dart';
import 'Help.dart';
import 'background.dart';
import 'firstpage.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            SizedBox(
              width: double.infinity,
              height:60,
              child:
                TextButton.icon(
                    icon: Icon(Icons.account_circle,color: Colors.black),
                    label:
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('アカウント設定', style:TextStyle(fontSize:20, color: Colors.black)),
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
                icon: Icon(Icons.verified_user,color: Colors.black),
                label:
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text('プライバシー設定', style:TextStyle(fontSize:20,color: Colors.black),textAlign: TextAlign.left),
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
                  icon: Icon(Icons.help,color: Colors.black),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Text('ヘルプ', style:TextStyle(fontSize:20,color: Colors.black),textAlign: TextAlign.left),
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
    ));
  }
}