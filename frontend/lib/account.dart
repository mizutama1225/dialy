import 'package:flutter/material.dart';
import 'IconImageSetting.dart';
import 'background.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(

        childWidget:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                ),
              const SizedBox(width: 50,),
              const Text('ユーザー名',style:TextStyle(fontSize: 20) ,),//ここの文字列をデータベースから持ってきたい
              ],
            ),
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('フォロー中　'),
                Text('10',style:TextStyle(fontSize: 20) ,),//ここの数字をデータベースから持ってきたい
                SizedBox(width: 30,),
                Text('フォロワー　'),
                Text('10',style:TextStyle(fontSize: 20) ,),//ここの数字をデータベースから持ってきたい
            ],)

          ],

        ),
      ),
    ));
  }
}