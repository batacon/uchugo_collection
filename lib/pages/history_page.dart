import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/components/common_scaffold.dart';
import 'package:uchugo_collection/components/history_list_item.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final checkedChars = ref.watch(checkedKanaCharsProvider);
    return CommonScaffold(
      body: ListView(
        children: [
          _buildPageTitle(context),
          _buildHistoryList(checkedChars),
        ],
      ),
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Text('History', style: Theme.of(context).textTheme.headline1),
        const SizedBox(width: 60),
      ],
    );
  }

  Widget _buildHistoryList(List<KanaChar> checkedChars) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: checkedChars.length,
      itemBuilder: (context, index) => HistoryListItem(checkedChars[index]),
    );
  }
}
