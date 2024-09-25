import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'MailSetting2.dart';

class MailSettingPage extends StatelessWidget {
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
                    const Text('新しいパスワードを入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    Padding(padding: EdgeInsets.only(left:10,right:10),
                      child: const TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          fillColor: Colors.white70,
                          filled:true,
                        )
                    ),
                    ),
                    const SizedBox(height:40,),
                    const Text('もう一度入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    Padding(padding: EdgeInsets.only(left:10,right:10),
                      child: const TextField(
                          decoration:InputDecoration(
                            border:OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            fillColor: Colors.white70,
                            filled:true,
                          )
                      ),
                    ),
                    const SizedBox(height:50,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MailSetting2Page()),
                      );
                    },
                      child: const Text('変更する'),)
                  ],
                )
            )
          ],
        ),
      ),
    ));
  }
}