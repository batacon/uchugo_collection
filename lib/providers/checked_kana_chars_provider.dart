import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uchugo_collection/firebase/firebase_analytics_helper.dart';
import 'package:uchugo_collection/models/di_container.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/repositories/checked_chars_repository.dart';

final checkedKanaCharsProvider = StateNotifierProvider.autoDispose<CheckedKanaCharsProvider, List<KanaChar>>((ref) {
  return CheckedKanaCharsProvider(
    ref.watch(checkedCharsRepositoryProvider),
  );
});

class CheckedKanaCharsProvider extends StateNotifier<List<KanaChar>> {
  static const List<List<String>> _gojuonCharsList = [
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

  static const List<List<String>> _dakuonHandakuonCharsList = [
    ['が', 'ぎ', 'ぐ', 'げ', 'ご'],
    ['ざ', 'じ', 'ず', 'ぜ', 'ぞ'],
    ['だ', 'ぢ', 'づ', 'で', 'ど'],
    ['ば', 'び', 'ぶ', 'べ', 'ぼ'],
    ['ぱ', 'ぴ', 'ぷ', 'ぺ', 'ぽ'],
  ];

  static const List<List<String>> _yoonCharsList = [
    ['きゃ', '', 'きゅ', '', 'きょ'],
    ['ぎゃ', '', 'ぎゅ', '', 'ぎょ'],
    ['しゃ', '', 'しゅ', 'しぇ', 'しょ'],
    ['じゃ', '', 'じゅ', 'じぇ', 'じょ'],
    ['ちゃ', '', 'ちゅ', 'ちぇ', 'ちょ'],
    ['にゃ', '', 'にゅ', '', 'にょ'],
    ['ひゃ', '', 'ひゅ', '', 'ひょ'],
    ['びゃ', '', 'びゅ', '', 'びょ'],
    ['ぴゃ', '', 'ぴゅ', '', 'ぴょ'],
    ['みゃ', '', 'みゅ', '', 'みょ'],
    ['りゃ', '', 'りゅ', '', 'りょ'],
  ];

  static const List<List<String>> _allCharsList = [
    ..._gojuonCharsList,
    ..._dakuonHandakuonCharsList,
    ..._yoonCharsList,
  ];

  final CheckedCharsRepository _checkedCharsRepository;

  CheckedKanaCharsProvider(this._checkedCharsRepository) : super([]) {
    _checkedCharsRepository.getCheckedChars().then((checkedChars) {
      state = checkedChars;
    });
  }

  List<List<String>> get gojuonCharsList => _gojuonCharsList;

  List<List<String>> get dakuonHandakuonCharsList => _dakuonHandakuonCharsList;

  List<List<String>> get yoonCharsList => _yoonCharsList;

  int get _allCharsCount => _allCharsList.expand((row) => row).where((char) => char.isNotEmpty).length;

  int get completionRateInPercent => (state.length / _allCharsCount * 100).floor();

  double get completionRate => (state.length / _allCharsCount * 100).floorToDouble() / 100;

  bool isChecked(final String char) => state.any((kanaChar) => kanaChar.char == char);

  DateTime checkedDateOf(final String char) => state.firstWhere((kanaChar) => kanaChar.char == char).checkedDate;

  void uncheckChar(final String char) {
    state = state.where((kanaChar) => kanaChar.char != char).toList();
    _checkedCharsRepository.saveAll(state);
    FirebaseAnalyticsHelper.logEvent('remove_checked_char', {'char': char});
  }

  void addOrUpdateCheckedChar(final String char, final DateTime checkedDate) {
    final newKanaChar = KanaChar(char: char, checkedDate: checkedDate);
    isChecked(char) ? _updateCheckedChar(newKanaChar) : _addCheckedChar(newKanaChar);
  }

  void _addCheckedChar(final KanaChar newKanaChar) {
    state = [newKanaChar, ...state];
    _sortAndSaveState();
    FirebaseAnalyticsHelper.logEvent('add_checked_char', {'char': newKanaChar.char});
  }

  void _updateCheckedChar(final KanaChar newKanaChar) {
    state = state.map((kanaCharInState) {
      return kanaCharInState.char == newKanaChar.char ? newKanaChar : kanaCharInState;
    }).toList();
    _sortAndSaveState();
    FirebaseAnalyticsHelper.logEvent('update_checked_char', {'char': newKanaChar.char});
  }

  void _sortAndSaveState() {
    state = _sortedKanaCharsByDateDesc(state);
    _checkedCharsRepository.saveAll(state);
  }

  List<KanaChar> _sortedKanaCharsByDateDesc(List<KanaChar> kanaChars) {
    return kanaChars..sort((a, b) => b.checkedDate.compareTo(a.checkedDate));
  }
}
