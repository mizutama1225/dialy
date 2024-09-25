import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting.dart';
import 'MailSetting.dart';

class PrivacySettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            SizedBox(
                width: double.infinity,
                height:60,
                child:
                TextButton.icon(
                  icon: Icon(Icons.lock,color: Colors.black,),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('パスワードを変更する', style:TextStyle(fontSize:20,color: Colors.black)),
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
                  icon: Icon(Icons.mail,color: Colors.black,),
                  label:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('メールアドレスを変更する', style:TextStyle(fontSize:20,color: Colors.black)),
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
    ));
  }
}