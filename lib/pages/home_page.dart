import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/components/char_panel.dart';
import 'package:uchugo_collection/components/common_scaffold.dart';
import 'package:uchugo_collection/components/completion_rate_section.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    ref.watch(checkedKanaCharsProvider);
    final allCharsList = ref.watch(checkedKanaCharsProvider.notifier).allCharsList;
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: ListView(
          children: [
            const CompletionRateSection(),
            const SizedBox(height: 40),
            const Text('50音', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Column(
              children: allCharsList.map((charRow) {
                return Column(
                  children: [
                    _buildCharRow(charRow),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharRow(final List<String> chars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chars.map((char) {
        if (char == '') return const SizedBox(width: 64);

        return CharPanel(char);
      }).toList(),
    );
  }
}
