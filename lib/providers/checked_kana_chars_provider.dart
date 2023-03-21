import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/repositories/checked_chars_repository.dart';

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
  final CheckedCharsRepository _checkedCharsRepository = CheckedCharsRepository();

  CheckedKanaCharsProvider() : super([]) {
    _checkedCharsRepository.getCheckedChars().then((checkedChars) {
      state = checkedChars;
    });
  }

  List<List<String>> get allCharsList => _allCharsList;

  int get _allCharsCount => _allCharsList.expand((row) => row).where((char) => char != '').length;

  int get completionRateInPercent => (state.length / _allCharsCount * 100).floor();

  double get completionRate => (state.length / _allCharsCount * 100).floorToDouble() / 100;

  bool isChecked(final String char) => state.any((kanaChar) => kanaChar.char == char);

  DateTime checkedDateOf(final String char) => state.firstWhere((kanaChar) => kanaChar.char == char).checkedDate;

  void uncheckChar(final String char) {
    state = state.where((kanaChar) => kanaChar.char != char).toList();
    _checkedCharsRepository.saveAll(state);
  }

  void addOrUpdateCheckedChar(final String char, final DateTime checkedDate) {
    final newKanaChar = KanaChar(char: char, checkedDate: checkedDate);
    if (!isChecked(char)) {
      state = [newKanaChar, ...state];
    } else {
      state = state.map((kanaCharInState) {
        return kanaCharInState.char == newKanaChar.char ? newKanaChar : kanaCharInState;
      }).toList();
    }
    state = _sortedKanaCharsByDateDesc(state);
    _checkedCharsRepository.saveAll(state);
  }

  List<KanaChar> _sortedKanaCharsByDateDesc(List<KanaChar> kanaChars) {
    return kanaChars..sort((a, b) => b.checkedDate.compareTo(a.checkedDate));
  }
}