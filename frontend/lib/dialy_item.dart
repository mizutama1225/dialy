
import 'package:flutter/material.dart';
import 'package:dialy/models/dialy.dart';

class DialyItem extends StatelessWidget {
  const DialyItem(this.dialy, {super.key});

  final Dialy dialy;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            const Icon(Icons.person),
            Text(dialy.userName),
          ],
        ),
      ),
    );
  }
}
