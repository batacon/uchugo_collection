import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class CharPanel extends ConsumerWidget {
  final String char;

  const CharPanel(this.char, {super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final isChecked = ref.watch(checkedKanaCharsProvider.notifier).isChecked(char);
    return InkWell(
      onTap: () => ref.watch(checkedKanaCharsProvider.notifier).toggleChecked(char),
      child: CharBox(char: char, isChecked: isChecked),
    );
  }
}
