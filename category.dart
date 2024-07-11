import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromARGB(203, 0, 89, 255),
  });

  final String id;
  final String title;
  final Color color;
}
