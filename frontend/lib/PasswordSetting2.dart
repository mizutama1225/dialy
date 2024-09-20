import 'package:flutter/material.dart';
import 'main.dart';
import 'setting.dart';

class PasswordSettingCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('パスワード変更完了'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Center(
            child:Column(
              children:[
                const SizedBox(height:20,),
                const Text('パスワードが変更されました', style:TextStyle(fontSize:20)),
                const SizedBox(height:50,),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
                  child: const Text('設定に戻る'),)
              ],
            )

    )


        ],
      ),
    );
  }
}