import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:uchugo_collection/models/kana_char.dart';
import 'package:uchugo_collection/repositories/checked_chars_repository.dart';

import '../mocks/mock_shared_preferences.mocks.dart';

void main() {
  group('CheckedCharsRepository', () {
    late CheckedCharsRepository checkedCharsRepository;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      checkedCharsRepository = CheckedCharsRepository(Future.value(mockSharedPreferences));
    });

    test('getCheckedChars retrieves stored data correctly', () async {
      final kanaChar = KanaChar(char: 'あ', checkedDate: DateTime(2023, 3, 26));
      final jsonString = kanaChar.toJsonString;

      when(mockSharedPreferences.getStringList('checkedChars')).thenReturn([jsonString]);

      final retrievedKanaChars = await checkedCharsRepository.getCheckedChars();

      expect(retrievedKanaChars.length, 1);
      expect(retrievedKanaChars.first.char, kanaChar.char);
      expect(retrievedKanaChars.first.checkedDate, kanaChar.checkedDate);
    });

    test('saveAll stores data correctly', () async {
      final kanaChar = KanaChar(char: 'あ', checkedDate: DateTime(2023, 3, 26));
      final jsonString = kanaChar.toJsonString;

      when(mockSharedPreferences.setStringList('checkedChars', [jsonString])).thenAnswer((_) => Future.value(true));

      await checkedCharsRepository.saveAll([kanaChar]);

      verify(mockSharedPreferences.setStringList('checkedChars', [jsonString])).called(1);
    });
  });
}
