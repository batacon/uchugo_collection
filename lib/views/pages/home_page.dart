import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/providers/checked_kana_chars_provider.dart';
import 'package:uchugo_collection/views/components/common_scaffold.dart';
import 'package:uchugo_collection/views/components/completion_rate_section.dart';
import 'package:uchugo_collection/views/components/kana_char_panel.dart';

class HomePage extends ConsumerWidget {
  static const screenName = 'home_page';

  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    ref.watch(checkedKanaCharsProvider);
    final gojuonCharsList = ref.watch(checkedKanaCharsProvider.notifier).gojuonCharsList;
    final dakuonHandakuonCharsList = ref.watch(checkedKanaCharsProvider.notifier).dakuonHandakuonCharsList;
    final yoonCharsList = ref.watch(checkedKanaCharsProvider.notifier).yoonCharsList;
    return CommonScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              const CompletionRateSection(),
              const SizedBox(height: 24),
              _buildCharsListSection(context, '50音', gojuonCharsList),
              const SizedBox(height: 4),
              _buildCharsListSection(context, '濁音&半濁音', dakuonHandakuonCharsList),
              const SizedBox(height: 4),
              _buildCharsListSection(context, '拗音', yoonCharsList),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCharsListSection(final BuildContext context, final String title, final List<List<String>> charsList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 16),
        Column(
          children: charsList.map((charRow) {
            return Column(
              children: [
                _buildCharRow(charRow),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCharRow(final List<String> chars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chars.map((char) {
        if (char == '') return const SizedBox(width: 64);

        return KanaCharPanel(char);
      }).toList(),
    );
  }
}
