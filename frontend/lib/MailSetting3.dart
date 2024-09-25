import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'setting.dart';
import 'home_screen.dart';

class MailSetting3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Center(
        child: Column(
          children: [
            Center(
                child:Column(
                  children:[
                    const SizedBox(height:80,),
                    const Text('メールアドレスが変更されました', style:TextStyle(fontSize:15)),
                    const SizedBox(height:40,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                      child: const Text('ホームに戻る'),)
                  ],
                )
            )
          ],
        ),
      ),
    ));
  }
}