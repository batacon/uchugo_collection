import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HistoryListItem extends ConsumerWidget {
  final KanaChar checkedChar;

  const HistoryListItem(this.checkedChar, {super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return ListTile(
      leading: CharBox(char: checkedChar.char, size: 40),
      title: Text(
        checkedChar.checkedDateFormatted,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/edit_icon.svg'),
          ),
          IconButton(
            onPressed: () {
              ref.watch(checkedKanaCharsProvider.notifier).uncheckChar(checkedChar.char);
            },
            icon: SvgPicture.asset('assets/icons/close_icon.svg'),
          ),
        ],
      ),
    );
  }
}
