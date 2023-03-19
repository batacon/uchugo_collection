import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HistoryListItem extends ConsumerWidget {
  final KanaChar _checkedChar;

  const HistoryListItem(this._checkedChar, {super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return ListTile(
      leading: CharBox(char: _checkedChar.char, size: 40),
      title: Text(
        _checkedChar.checkedDateFormatted,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEditButton(context, ref),
          _buildDeleteButton(ref),
        ],
      ),
    );
  }

  Widget _buildEditButton(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final now = DateTime.now();
        showDatePicker(
          context: context,
          initialDate: now,
          firstDate: now.subtract(const Duration(days: 365)),
          lastDate: now,
        ).then((date) => _updateChar(ref, date));
      },
      icon: SvgPicture.asset('assets/icons/edit_icon.svg'),
    );
  }

  void _updateChar(final WidgetRef ref, final DateTime? date) {
    if (date == null) return;

    ref.watch(checkedKanaCharsProvider.notifier).updateCheckedChar(_checkedChar, date);
  }

  Widget _buildDeleteButton(WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.watch(checkedKanaCharsProvider.notifier).uncheckChar(_checkedChar.char);
      },
      icon: SvgPicture.asset('assets/icons/close_icon.svg'),
    );
  }
}
