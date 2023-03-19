import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HistoryListItem extends ConsumerWidget {
  final KanaChar _kanaChar;
  final bool isOdd;

  const HistoryListItem(
    this._kanaChar, {
    super.key,
    this.isOdd = false,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Row(
      children: [
        _buildPlanetIcon(),
        const SizedBox(width: 16),
        CharBox(char: _kanaChar.char, isChecked: true, size: 40),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            _kanaChar.checkedDateFormatted,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildEditButton(context, ref),
            _buildDeleteButton(ref),
          ],
        ),
      ],
    );
  }

  SvgPicture _buildPlanetIcon() {
    if (isOdd) return SvgPicture.asset('assets/icons/planet_left_icon.svg');
    return SvgPicture.asset('assets/icons/planet_right_icon.svg');
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

    ref.watch(checkedKanaCharsProvider.notifier).updateCheckedChar(_kanaChar, date);
  }

  Widget _buildDeleteButton(WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.watch(checkedKanaCharsProvider.notifier).uncheckChar(_kanaChar.char);
      },
      icon: SvgPicture.asset('assets/icons/close_icon.svg'),
    );
  }
}
