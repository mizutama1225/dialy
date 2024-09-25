import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting2.dart';
import 'background.dart';

class PasswordSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
      Column(
        children: [
          Center(
            child:Padding(
              padding: const EdgeInsets.all(8),
              child:Column(
                children:[
                  const SizedBox(height:80,),
                  const Text('古いパスワードを入力してください', style:TextStyle(fontSize:15)),
                  const SizedBox(height:20,),
                  const TextField(
                    decoration:InputDecoration(
                      border:OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      fillColor: Colors.white70,
                      filled: true,
                    )
                  ),
                  const SizedBox(height:40,),
                  const Text('新しいパスワードを入力してください', style:TextStyle(fontSize:15)),
                  const SizedBox(height:20,),
                  const TextField(
                      decoration:InputDecoration(
                          border:OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        fillColor: Colors.white70,
                        filled: true,
                      )
                  ),
                  const SizedBox(height:40,),
                  const Text('もう一度入力してください', style:TextStyle(fontSize:15)),
                  const SizedBox(height:20,),
                  const TextField(
                      decoration:InputDecoration(
                          border:OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        fillColor: Colors.white70,
                        filled: true,
                       )
                  ),
                  const SizedBox(height:50,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordSettingCompletePage()),
                    );
                    },
                    child: const Text('変更する'),
                  )
      ],
    )
            )

    )


        ],
      ),
    ));
  }
}