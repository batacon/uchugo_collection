import 'package:flutter/material.dart';

class CharPanel extends StatefulWidget {
  final String char;

  const CharPanel(this.char, {super.key});

  @override
  State<CharPanel> createState() => _CharPanelState();
}

class _CharPanelState extends State<CharPanel> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.char == '') return const SizedBox(width: 64);

    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          // TODO: 文字とDateをセットでstateに保存する
        });
      },
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: _isChecked ? Colors.blue : Colors.grey[400],
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
            widget.char,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
