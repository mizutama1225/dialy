import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';
import 'package:dialy/dialy_item.dart';

class DialyList extends StatelessWidget {
  DialyList({super.key, required this.dialies});

  final List<Dialy> dialies;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {})
      ]),
      body: ListView.builder(
        itemCount: dialies.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(dialies[index]),
          child: DialyItem(dialies[index]),
        ),
      ),
    );
  }
}
