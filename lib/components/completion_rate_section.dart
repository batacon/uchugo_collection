import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/pages/history_page.dart';
import 'package:uchugo_collection/providers/checked_kana_chars_provider.dart';

class CompletionRateSection extends ConsumerWidget {
  const CompletionRateSection({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    ref.watch(checkedKanaCharsProvider);
    final completionRate = ref.watch(checkedKanaCharsProvider.notifier).completionRate;
    final completionRateInPercent = ref.watch(checkedKanaCharsProvider.notifier).completionRateInPercent;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HistoryPage()),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('コンプリート率'),
              Text('$completionRateInPercent%'),
            ],
          ),
          const SizedBox(height: 8),
          _buildCompletionRateBar(completionRate),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('履歴を見る︎'),
                Text('▶︎', style: TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCompletionRateBar(double completionRate) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: completionRate),
      duration: const Duration(milliseconds: 250),
      builder: (context, double value, _) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          child: LinearProgressIndicator(
            backgroundColor: Colors.orange,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 28,
            value: value,
          ),
        );
      },
    );
  }
}
