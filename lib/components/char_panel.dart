import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class CharPanel extends ConsumerStatefulWidget {
  final String char;

  const CharPanel(this.char, {super.key});

  @override
  ConsumerState<CharPanel> createState() => _CharPanelState();
}

class _CharPanelState extends ConsumerState<CharPanel> {
  final _provider = checkedKanaCharsProvider;

  @override
  Widget build(BuildContext context) {
    final isChecked = ref.watch(_provider.notifier).isChecked(widget.char);
    return InkWell(
      onTap: () {
        setState(() => ref.read(_provider.notifier).toggleChecked(widget.char));
      },
      child: CharBox(char: widget.char, isChecked: isChecked),
    );
  }
}
