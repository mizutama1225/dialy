import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting2.dart';

class PasswordSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5de0e6),
        title: const Text('パスワード変更'),
      ),
      body: Column(
        children: [
          Center(
            child:Column(
              children:[
                const SizedBox(height:20,),
                const Text('古いパスワードを入力してください', style:TextStyle(fontSize:15)),
                const SizedBox(height:20,),
                const TextField(
                    decoration:InputDecoration(
                      border:OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    )
                ),
                const SizedBox(height:40,),
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
                      MaterialPageRoute(builder: (context) => PasswordSettingCompletePage()),
                  );
                  },
                  child: const Text('変更する'),)
              ],
            )

    )


        ],
      ),
    );
  }
}