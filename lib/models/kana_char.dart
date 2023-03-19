import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kana_char.freezed.dart';

@freezed
class KanaChar with _$KanaChar {
  const KanaChar._();

  const factory KanaChar({
    required String char,
    required DateTime checkedDate,
  }) = _KanaChar;

  factory KanaChar.fromJson(Map<String, dynamic> json) {
    return KanaChar(
      char: json['char'] as String,
      checkedDate: DateTime.parse(json['checkedDate'] as String),
    );
  }

  String get checkedDateFormatted => '${checkedDate.year}/${checkedDate.month}/${checkedDate.day}';

  String get toJsonString => jsonEncode(toJson);

  Map<String, dynamic> get toJson {
    return {
      'char': char,
      'checkedDate': checkedDate.toIso8601String(),
    };
  }
}
