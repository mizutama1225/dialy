import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/user_history.dart';

class DialyItem extends StatelessWidget {
  const DialyItem(this.dialy, {super.key});
  final Dialy dialy;

  void openScreen(Dialy user) {}
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UserHistory(user: dialy)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                size: 30,
              ),
              const SizedBox(width: 20),
              Text(
                dialy.userName,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
