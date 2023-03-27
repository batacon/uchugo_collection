import 'package:flutter_test/flutter_test.dart';
import 'package:uchugo_collection/models/kana_char.dart';

void main() {
  group('KanaChar', () {
    const testChar = 'あ';
    final testDate = DateTime(2023, 3, 26);
    const testJsonString = '{"char":"あ","checkedDate":"2023-03-26T00:00:00.000"}';
    final testJson = {
      'char': 'あ',
      'checkedDate': '2023-03-26T00:00:00.000',
    };

    test('constructs correctly', () {
      final kanaChar = KanaChar(char: testChar, checkedDate: testDate);
      expect(kanaChar.char, testChar);
      expect(kanaChar.checkedDate, testDate);
    });

    test('fromJson method works properly', () {
      final kanaChar = KanaChar.fromJson(testJson);
      expect(kanaChar.char, testChar);
      expect(kanaChar.checkedDate, testDate);
    });

    test('toJson method works properly', () {
      final kanaChar = KanaChar(char: testChar, checkedDate: testDate);
      final json = kanaChar.toJson;
      expect(json, testJson);
    });

    test('toJsonString method works properly', () {
      final kanaChar = KanaChar(char: testChar, checkedDate: testDate);
      final jsonString = kanaChar.toJsonString;
      expect(jsonString, testJsonString);
    });

    test('checkedDateFormatted getter works properly', () {
      final kanaChar = KanaChar(char: testChar, checkedDate: testDate);
      final formattedDate = kanaChar.checkedDateFormatted;
      expect(formattedDate, '2023/3/26');
    });
  });
}
