import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/char_box.dart';
import 'package:uchugo_collection/components/common_scaffold.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/providers/kana_char_collection_provider.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final checkedChars = ref.watch(checkedKanaCharsProvider);
    return CustomScaffold(
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
        const Text(
          'History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 60),
      ],
    );
  }

  Widget _buildHistoryList(List<KanaChar> checkedChars) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: checkedChars.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CharBox(char: checkedChars[index].char, size: 40),
          title: Text(
            checkedChars[index].checkedDateFormatted,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/edit_icon.svg'),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/close_icon.svg'),
              ),
            ],
          ),
        );
      },
    );
  }
}
