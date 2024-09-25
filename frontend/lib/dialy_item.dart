import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/user_history.dart';

class DialyItem extends StatelessWidget {
  const DialyItem(this.dialy, {super.key});
  final Dialy dialy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UserHistory(user: dialy)),
        );
      },
      child: Row(
        children: [
          const Icon(Icons.person, size: 30),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dialy.userName, // dialyオブジェクトのuserNameを表示
                style: const TextStyle(fontSize: 18),
              ),
              // Text(
              //   dialy.dialyText, // dialyオブジェクトのdialyTextを表示
              //   style: const TextStyle(
              //     color: Color.fromARGB(255, 66, 64, 64),
              //     fontSize: 15,
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          Text(dialy.formattedDate), // 日付を表示
        ],
      ),
    );
  }
}
