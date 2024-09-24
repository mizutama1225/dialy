import 'package:flutter/material.dart';

class GradientAppBar {
  static PreferredSizeWidget build(
    BuildContext context, {
    required Widget title,
  }) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: title,
    );
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        appBar.preferredSize.height,
      ),
      child: Container(
        child: appBar,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(93, 224, 230, 1),
              Color.fromRGBO(0, 74, 173, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
