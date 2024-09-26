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
          // imageUrlが空かどうかを確認してアイコンを表示
          dialy.imageUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage( "http://localhost:80/"+ dialy.imageUrl),
                  radius: 30,
                )
              : const CircleAvatar(
                  backgroundImage: AssetImage('image/SNS_Icon.jpg'),
                  radius: 30,
                ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dialy.userName, // dialyオブジェクトのuserNameを表示
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
