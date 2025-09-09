import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    this.txtColor = Colors.black,
    required this.image,
  });

  final String id;
  final String title;
  final Color color;
  final Color? txtColor;
  final String image;
}
