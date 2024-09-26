import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dialy/main.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});
  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  int dialyIndex = 0;
  List<dynamic> newDialies = []; // 初期値は空のリスト

  @override
  void initState() {
    super.initState();
    fetchDialies();
  }

  Future<void> fetchDialies() async {
    try {
      var url = Uri.parse('http://localhost:80/users/${USERID}/unchecked_letters/'); // USERIDを適切なユーザーIDに置き換えてください
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          newDialies = jsonData;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _incrementIndex() {
    if (dialyIndex < newDialies.length - 1) {
      setState(() {
        dialyIndex++;
      });
    }
  }

  void _decrementIndex() {
    if (dialyIndex > 0) {
      setState(() {
        dialyIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      childWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 35,
                ),
              if (newDialies.isNotEmpty)
                Text("${newDialies[dialyIndex]['from']['username']}さんからの日記",style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 233, 125, 118)),
                width: 300,
                height: 450,
              child: newDialies.isNotEmpty
                  ?  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child :   Text(
                      newDialies[dialyIndex]['letter'],
                      style: const TextStyle(fontSize: 15),
                    )
                  )

                  : const Text('日記はまだ届いていません！\n次の日記をお楽しみに！')),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: _decrementIndex,
                  icon: Icon(
                    Icons.arrow_back,
                    color: dialyIndex > 0 ? Colors.black87 : Colors.black38,
                  )),
            if (newDialies.isNotEmpty)
              Text("${dialyIndex + 1}/${newDialies.length}"),
              IconButton(
                  onPressed: _incrementIndex,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: dialyIndex < newDialies.length - 1
                        ? Colors.black87
                        : Colors.black38,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
