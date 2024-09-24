import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/dialy_item.dart';
import 'package:dialy/background.dart';

class DialyList extends StatelessWidget {
  DialyList({super.key, required this.dialies});

  final List<Dialy> dialies;

  @override
  Widget build(context) {
    return Scaffold(
      body:
          // childWidget: ListView.builder(
          //   itemCount: dialies.length,
          //   itemBuilder: (ctx, index) => Dismissible(
          //     key: ValueKey(dialies[index]),
          //     child: DialyItem(dialies[index]),
          //   ),
          // ),
          ListView.separated(
              itemBuilder: (ctx, index) => Container(
                    padding: const EdgeInsets.all(15),
                    child: DialyItem(dialies[index]),
                  ),
              separatorBuilder: (ctx, index) {
                return const Divider(
                  height: 0.5,
                );
              },
              itemCount: dialies.length),
    );
  }
}
