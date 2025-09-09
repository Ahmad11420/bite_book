import 'package:flutter/material.dart';

class RowInMealitems extends StatelessWidget {
  const RowInMealitems({super.key, required this.icon, required this.text});

  //final String label='';
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        Text(text, style: TextStyle(fontSize: 26, color: Colors.white)),
      ],
    );
  }
}
