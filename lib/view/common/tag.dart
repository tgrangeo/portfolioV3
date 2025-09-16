import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(side: BorderSide(color: Colors.white24)),
        color: Colors.white.withAlpha(2),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.white70),
      ),
    );
  }
}
