import 'package:dialy/home_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class MailSetting2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5de0e6),
        title: const Text('メールアドレス変更'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
                child:Column(
                  children:[
                    const SizedBox(height:20,),
                    const Text('メールに送られた認証番号を入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    const TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(),
                        )
                    ),
                    const SizedBox(height:40,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                      child: const Text('認証する'),)
                  ],
                )

            )

          ],





        ),
      ),
    );
  }
}