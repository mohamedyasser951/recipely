import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String text;
  const CategoryItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: OutlinedButton(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 5, vertical: 5))),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
