import 'package:flutter/material.dart';
import 'package:frontend/models/category.dart';

class HomeSuccessView extends StatelessWidget {
  final List<Category> categories;

  const HomeSuccessView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories.map((category) {
        return Text(category.name);
      }).toList(),
    );
  }
}
