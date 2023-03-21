import 'package:flutter/material.dart';
import 'package:uchugo_collection/constants/custom_color.dart';

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
        color: isChecked ? CustomColor.primary : CustomColor.gray,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          char,
          style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
