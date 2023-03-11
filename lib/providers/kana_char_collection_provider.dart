import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/models/kana_char.dart';

final checkedKanaCharsProvider = StateNotifierProvider.autoDispose<CheckedKanaCharsProvider, List<KanaChar>>((ref) {
  return CheckedKanaCharsProvider();
});

class CheckedKanaCharsProvider extends StateNotifier<List<KanaChar>> {
  static const List<List<String>> _allCharsList = [
    ['あ', 'い', 'う', 'え', 'お'],
    ['か', 'き', 'く', 'け', 'こ'],
    ['さ', 'し', 'す', 'せ', 'そ'],
    ['た', 'ち', 'つ', 'て', 'と'],
    ['な', 'に', 'ぬ', 'ね', 'の'],
    ['は', 'ひ', 'ふ', 'へ', 'ほ'],
    ['ま', 'み', 'む', 'め', 'も'],
    ['や', '', 'ゆ', '', 'よ'],
    ['ら', 'り', 'る', 'れ', 'ろ'],
    ['わ', '', 'を', '', 'ん'],
  ];

  CheckedKanaCharsProvider() : super([]);

  List<List<String>> get allCharsList => _allCharsList;

  int get allCharsCount => _allCharsList.expand((row) => row).where((char) => char != '').length;

  int get completionRateInPercent => (state.length / allCharsCount * 100).floor();

  double get completionRate => (state.length / allCharsCount * 100).floorToDouble() / 100;

  bool isChecked(String char) => state.any((kanaChar) => kanaChar.char == char);

  void toggleChecked(String char) {
    isChecked(char) ? _uncheckChar(char) : _checkChar(char);
  }

  void _checkChar(String char) {
    state = [
      ...state,
      KanaChar(char: char, checkedDate: DateTime.now()),
    ];
  }

  void _uncheckChar(String char) {
    state = state.where((kanaChar) => kanaChar.char != char).toList();
  }
}
