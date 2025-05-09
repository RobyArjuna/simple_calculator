import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final int flex;

  const CalcButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey.shade300,
          shape: CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child:
            text == '⌫'
                ? Icon(Icons.backspace_outlined, size: 28, color: Colors.black)
                : Text(
                  text,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
      ),
    );
  }
}
