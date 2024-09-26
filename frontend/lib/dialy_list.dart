import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/dialy_item.dart';

class DialyList extends StatelessWidget {
  const DialyList({super.key, required this.dialies});

  final List<Dialy> dialies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: ListView.separated(
          itemBuilder: (ctx, index) => Container(
            padding: const EdgeInsets.all(15),
            child: DialyItem(dialies[index]), // Dialyオブジェクトを正しく渡す
          ),
          separatorBuilder: (ctx, index) => const Divider(height: 0.5),
          itemCount: dialies.length,
        ),
      ),
    );
  }
}
