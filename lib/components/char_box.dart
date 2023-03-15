import 'package:flutter/material.dart';

class CharBox extends StatelessWidget {
  const CharBox({
    super.key,
    required this.char,
    this.size = 64,
    this.isChecked = false,
  });

  final double size;
  final bool isChecked;
  final String char;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isChecked ? Colors.blue : Colors.grey[400],
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(char, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
