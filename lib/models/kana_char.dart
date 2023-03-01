import 'package:freezed_annotation/freezed_annotation.dart';

part 'kana_char.freezed.dart';

@freezed
class KanaChar with _$KanaChar {
  const KanaChar._();

  const factory KanaChar({
    required String char,
    required DateTime checkedDate,
  }) = _KanaChar;

  String get checkedDateFormatted => '${checkedDate.year}/${checkedDate.month}/${checkedDate.day}';
}
