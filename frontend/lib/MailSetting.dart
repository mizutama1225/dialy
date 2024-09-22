import 'package:flutter/material.dart';
import 'main.dart';
import 'MailSetting2.dart';

class MailSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('メールアドレス変更'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
                child:Column(
                  children:[
                    const SizedBox(height:20,),
                    const Text('新しいパスワードを入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    const TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        )
                    ),
                    const SizedBox(height:40,),
                    const Text('もう一度入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    const TextField(
                        decoration:InputDecoration(
                          border:OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        )
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
    );
  }
}