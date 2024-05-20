import 'package:flutter/material.dart';

import '../core/color/color.dart';

class SaveButton extends StatelessWidget {
  final String txt;

  SaveButton({
    required this.txt,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: PrimaryColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              fontFamily: 'ProximaSoft',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}
