import 'package:flutter/material.dart';
import 'main.dart';
import 'setting.dart';
import 'UserNameSetting.dart';


class AccountSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('アカウント設定'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height:30,
            ),
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
                        MaterialPageRoute(builder: (context) => UserNameSettingPage()),
                      );
                    },
                    child: const Text("Input_Introduction"),
                  ),]
            ),


        const SizedBox(
          height:50,
        ),
        ElevatedButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
          );
        },
            child: Text('設定に戻る')),

          ],
        ),
      ),
    );
  }
}