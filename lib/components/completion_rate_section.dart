import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class CompletionRateSection extends ConsumerWidget {
  const CompletionRateSection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    ref.watch(checkedKanaCharsProvider);
    final completionRate = ref.watch(checkedKanaCharsProvider.notifier).completionRate;
    final completionRateInPercent = ref.watch(checkedKanaCharsProvider.notifier).completionRateInPercent;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('コンプリート率'),
            Text('$completionRateInPercent%'),
          ],
        ),
        const SizedBox(height: 8),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: completionRate),
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
}
