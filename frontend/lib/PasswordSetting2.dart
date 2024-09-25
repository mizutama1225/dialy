import 'package:flutter/material.dart';
import 'setting.dart';
import 'home_screen.dart';
import 'background.dart';

class PasswordSettingCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Column(
        children: [
          Center(
            child:Column(
              children:[
                const SizedBox(height:80,),
                const Text('パスワードが変更されました', style:TextStyle(fontSize:20)),
                const SizedBox(height:50,),
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
    ));
  }
}