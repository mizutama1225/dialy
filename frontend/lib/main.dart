import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: const Text('ホーム'),
    ),
    body: Center(
      child:Text('ここからホーム画面へ...'),
    )
    );
  }
}