import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/constants/custom_color.dart';
import 'package:uchugo_collection/providers/checked_kana_chars_provider.dart';
import 'package:uchugo_collection/providers/selected_date_provider.dart';

class KanaCharDialog extends ConsumerWidget {
  final String _char;
  final DateTime? _checkedDate;

  const KanaCharDialog(this._char, this._checkedDate, {Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final provider = selectedDateProvider(_checkedDate);
    final selectedDate = ref.watch(provider);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogHeader(context),
            const SizedBox(height: 16),
            _buildDateFormButton(
              context,
              ref,
              selectedDate,
              (date) => ref.watch(provider.notifier).update((state) => date),
            ),
            const SizedBox(height: 16),
            _buildDialogSubmitButton(context, ref, selectedDate),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogHeader(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('「$_char」って言った！', style: Theme.of(context).textTheme.headline2),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildDateFormButton(
    final BuildContext context,
    final WidgetRef ref,
    final DateTime selectedDate,
    final Function(DateTime) updateSelectedDate,
  ) {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now(),
        ).then((pickedDate) {
          if (pickedDate != null) {
            updateSelectedDate(pickedDate);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomColor.grayLight,
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today_outlined, size: 16, color: CustomColor.primary),
            const SizedBox(width: 8),
            Text('${selectedDate.year}-${selectedDate.month}-${selectedDate.day}'),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogSubmitButton(
    final BuildContext context,
    final WidgetRef ref,
    final DateTime selectedDate,
  ) {
    final buttonLabel = _checkedDate == null ? '登録する' : '修正する';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
      ),
      onPressed: () {
        ref.watch(checkedKanaCharsProvider.notifier).addOrUpdateCheckedChar(_char, selectedDate);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('「$_char」を${_checkedDate == null ? '登録' : '修正'}しました'),
          duration: const Duration(seconds: 3),
        ));
        Navigator.pop(context);
      },
      child: Text(buttonLabel),
    );
  }
}
