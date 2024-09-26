import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text('Dialyへようこそ'),
      // ),
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dialyへようこそ",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'image/dialy-white.png',
                width: 270,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "新規アカウント登録はこちら",
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("ログインはこちら"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
