import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchugo_collection/models/kana_char.dart';

class CheckedCharsRepository {
  static const String _checkedCharsKey = 'checkedChars';

  final Future<SharedPreferences> _prefs;

  CheckedCharsRepository(this._prefs);

  Future<List<KanaChar>> getCheckedChars() async {
    final prefs = await _prefs;
    final checkedCharsJson = prefs.getStringList(_checkedCharsKey) ?? [];
    return checkedCharsJson.map((char) {
      final kanaChar = jsonDecode(char) as Map<String, dynamic>;
      return KanaChar.fromJson(kanaChar);
    }).toList();
  }

  Future<void> saveAll(final List<KanaChar> kanaChars) async {
    final prefs = await _prefs;
    final newCheckedCharsJson = kanaChars.map((kanaChar) => kanaChar.toJsonString).toList();
    prefs.setStringList(_checkedCharsKey, newCheckedCharsJson);
  }
}
