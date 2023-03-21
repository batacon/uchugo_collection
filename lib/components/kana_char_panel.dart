import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/components/kana_char_dialog.dart';
import 'package:uchugo_collection/providers/checked_kana_chars_provider.dart';

class KanaCharPanel extends ConsumerWidget {
  final String char;

  const KanaCharPanel(this.char, {super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final isChecked = ref.watch(checkedKanaCharsProvider.notifier).isChecked(char);
    final checkedDate = isChecked ? ref.watch(checkedKanaCharsProvider.notifier).checkedDateOf(char) : null;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => KanaCharDialog(char, checkedDate),
        );
      },
      child: CharBox(char: char, isChecked: isChecked),
    );
  }
}
