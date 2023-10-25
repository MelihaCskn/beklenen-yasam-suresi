

import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final IconData icon;
  final String data;
  MyColumn({required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 50,
      ),
      SizedBox(height: 10),
      Text(
        "$data",
        style: TextStyle(
            color: Colors.black54, fontSize: 40, fontWeight: FontWeight.bold),
      )
    ]);
  }
}

