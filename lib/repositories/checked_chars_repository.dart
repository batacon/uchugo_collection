import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchugo_collection/models/kana_char.dart';

class CheckedCharsRepository {
  static const String _checkedCharsKey = 'checkedChars';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<KanaChar>> getCheckedChars() async {
    final prefs = await _prefs;
    final checkedCharsJson = prefs.getStringList(_checkedCharsKey) ?? [];
    return checkedCharsJson.map((char) {
      final kanaChar = jsonDecode(char) as Map<String, dynamic>;
      return KanaChar.fromJson(kanaChar);
    }).toList();
  }

  Future<void> checkChar(final KanaChar kanaChar) async {
    final prefs = await _prefs;
    final checkedCharsJson = prefs.getStringList(_checkedCharsKey) ?? [];
    final kanaCharJson = jsonEncode(kanaChar.toJson());
    final newCheckedCharsJson = [...checkedCharsJson, kanaCharJson];
    prefs.setStringList(_checkedCharsKey, newCheckedCharsJson);
  }

  Future<void> uncheckChar(final String char) async {
    final prefs = await _prefs;
    final checkedCharsJson = prefs.getStringList(_checkedCharsKey) ?? [];
    final newCheckedChars = checkedCharsJson
        .map((kanaCharJson) => jsonDecode(kanaCharJson) as Map<String, dynamic>)
        .where((kanaChar) => kanaChar['char'] != char)
        .map((kanaChar) => jsonEncode(kanaChar))
        .toList();
    prefs.setStringList(_checkedCharsKey, newCheckedChars);
  }
}
