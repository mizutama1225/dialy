import 'package:dialy/background.dart';
import 'package:dialy/home_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'setting.dart';
import 'UserNameSetting.dart';
import 'IntroductionSetting.dart';
import 'IconImageSetting.dart';


class AccountSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(childWidget:
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            const Text('アカウント設定',style: TextStyle(fontSize: 30,color:Colors.white),),
            const SizedBox(height: 30,),
            Row(
              children:[
                const Text('　　ユーザー名'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserNameSettingPage()),
                      );
                    },
                    child: const Text("Input_UserName"),
                ),]
            ),
            Row(
                children:[
                  const Text('　　自己紹介　'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroductionSettingPage()),
                      );
                    },
                    child: const Text("Input_Introduction"),
                  ),]
            ),
            Row(
                children:[
                  const Text('　　プロフィール写真　　'),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IconImageSettingPage(title: '',)),
                      );
                    },
                    child:Container(
                      width:100,
                      height:100,
                      decoration: const BoxDecoration(
                        shape:BoxShape.circle,
                        image:DecorationImage(
                          fit:BoxFit.fill,
                          image:AssetImage('image/SNS_Icon.jpg')
                        )
                      ),
                    ),
                  )
                ]
            ),


        const SizedBox(
          height:50,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.white,
          ),
          onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
            child: Text('ホームに戻る')),

          ],
        ),
      ),
    ));
  }
}