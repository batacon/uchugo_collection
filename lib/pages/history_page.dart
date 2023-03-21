import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/common_scaffold.dart';
import 'package:uchugo_collection/components/history_list_item.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/checked_kana_chars_provider.dart';

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

  Widget _buildPageTitle(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text('HISTORY', style: Theme.of(context).textTheme.headline1),
          const SizedBox(width: 60),
        ],
      ),
    );
  }

  Widget _buildHistoryList(final List<KanaChar> kanaChars) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 16, bottom: 32),
      child: Column(
        children: kanaChars.map((kanaChar) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryListItem(kanaChar, isOdd: kanaChars.indexOf(kanaChar) % 2 == 0),
              if (kanaChar != kanaChars.last)
                SvgPicture.asset('assets/icons/orange_dots_icon.svg', width: 40, height: 32),
            ],
          );
        }).toList(),
      ),
    );
  }
}
