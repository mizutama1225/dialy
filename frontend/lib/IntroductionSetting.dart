import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting2.dart';
import 'AccountSetting.dart';

class IntroductionSettingPage extends StatelessWidget {
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
                    const Text('新しい自己紹介を入力してください', style:TextStyle(fontSize:15)),
                    const SizedBox(height:20,),
                    Padding(
                      padding: EdgeInsets.only(right: 10,left:10),
                        child:  TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                            decoration:InputDecoration(
                              border:OutlineInputBorder(),
                              fillColor: Colors.white70,
                              filled: true,

                            ),

                          )
                      ),
                    const SizedBox(height:50,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountSettingPage()),
                      );
                    },
                      child: const Text('変更する'),)
                  ],
                )

            )


          ],
        ),
        ));
  }
}