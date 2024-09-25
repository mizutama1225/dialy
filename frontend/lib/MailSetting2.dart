import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'setting.dart';
import 'MailSetting3.dart';

class MailSetting2Page extends StatelessWidget {
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
                    const Text('メールに送られた認証番号を入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    Padding(padding: EdgeInsets.only(left:10,right:10),
                      child: const TextField(
                          decoration:InputDecoration(
                            border:OutlineInputBorder(),
                            fillColor: Colors.white70,
                            filled:true,
                          )
                      ),
                    ),
                    const SizedBox(height:40,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MailSetting3Page()),
                      );
                    },
                      child: const Text('認証する'),)
                  ],
                )
            )
          ],
        ),
      ),
    ));
  }
}