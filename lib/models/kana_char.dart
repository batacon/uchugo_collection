import 'package:freezed_annotation/freezed_annotation.dart';

part 'kana_char.freezed.dart';

@freezed
class KanaChar with _$KanaChar {
  const factory KanaChar({
    required String char,
    required DateTime checkedDate,
  }) = _KanaChar;
}
