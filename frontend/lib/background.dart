import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({super.key, required this.childWidget});

  Widget childWidget;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(93, 224, 230, 1),
            Color.fromRGBO(0, 74, 173, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: childWidget,
    );
  }
}
