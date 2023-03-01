import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/components/char_panel.dart';
import 'package:uchugo_collection/components/completion_rate_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: SvgPicture.asset('assets/images/logo.svg'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: ListView(
          children: [
            const CompletionRateSection(),
            const SizedBox(height: 40),
            const Text('50音', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildCharRow(['あ', 'い', 'う', 'え', 'お']),
                const SizedBox(height: 16),
                _buildCharRow(['か', 'き', 'く', 'け', 'こ']),
                const SizedBox(height: 16),
                _buildCharRow(['さ', 'し', 'す', 'せ', 'そ']),
                const SizedBox(height: 16),
                _buildCharRow(['た', 'ち', 'つ', 'て', 'と']),
                const SizedBox(height: 16),
                _buildCharRow(['な', 'に', 'ぬ', 'ね', 'の']),
                const SizedBox(height: 16),
                _buildCharRow(['は', 'ひ', 'ふ', 'へ', 'ほ']),
                const SizedBox(height: 16),
                _buildCharRow(['ま', 'み', 'む', 'め', 'も']),
                const SizedBox(height: 16),
                _buildCharRow(['や', '', 'ゆ', '', 'よ']),
                const SizedBox(height: 16),
                _buildCharRow(['ら', 'り', 'る', 'れ', 'ろ']),
                const SizedBox(height: 16),
                _buildCharRow(['わ', '', 'を', '', 'ん']),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCharRow(List<String> chars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chars.map((char) {
        if (char == '') return const SizedBox(width: 64);

        return CharPanel(char);
      }).toList(),
    );
  }
}
