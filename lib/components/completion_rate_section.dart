import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class CompletionRateSection extends ConsumerWidget {
  static const _allKanaCharsCount = 46;

  const CompletionRateSection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final checkedKanaChars = ref.watch(checkedKanaCharsProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('コンプリート率'),
            Text('${(_completionRate(checkedKanaChars.length) * 100).floor()}%'),
          ],
        ),
        const SizedBox(height: 8),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _completionRate(checkedKanaChars.length)),
          duration: const Duration(milliseconds: 250),
          builder: (context, double value, _) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.orange,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 30,
                value: value,
              ),
            );
          },
        ),
      ],
    );
  }

  double _completionRate(final int checkedKanaCharsLength) {
    return (checkedKanaCharsLength / _allKanaCharsCount * 100).floorToDouble() / 100;
  }
}
