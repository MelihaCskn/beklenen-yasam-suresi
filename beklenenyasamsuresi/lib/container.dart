

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
final Function() onpres;
  MyContainer({this.renk = Colors.white, required this.child,required this.onpres});

  @override
  GestureDetector build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
      onTap: onpres,
    );
  }
}
