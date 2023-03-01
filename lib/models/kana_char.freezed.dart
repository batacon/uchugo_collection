// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kana_char.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KanaChar {
  String get char => throw _privateConstructorUsedError;
  DateTime get checkedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KanaCharCopyWith<KanaChar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanaCharCopyWith<$Res> {
  factory $KanaCharCopyWith(KanaChar value, $Res Function(KanaChar) then) =
      _$KanaCharCopyWithImpl<$Res, KanaChar>;
  @useResult
  $Res call({String char, DateTime checkedDate});
}

/// @nodoc
class _$KanaCharCopyWithImpl<$Res, $Val extends KanaChar>
    implements $KanaCharCopyWith<$Res> {
  _$KanaCharCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? char = null,
    Object? checkedDate = null,
  }) {
    return _then(_value.copyWith(
      char: null == char
          ? _value.char
          : char // ignore: cast_nullable_to_non_nullable
              as String,
      checkedDate: null == checkedDate
          ? _value.checkedDate
          : checkedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KanaCharCopyWith<$Res> implements $KanaCharCopyWith<$Res> {
  factory _$$_KanaCharCopyWith(
          _$_KanaChar value, $Res Function(_$_KanaChar) then) =
      __$$_KanaCharCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String char, DateTime checkedDate});
}

/// @nodoc
class __$$_KanaCharCopyWithImpl<$Res>
    extends _$KanaCharCopyWithImpl<$Res, _$_KanaChar>
    implements _$$_KanaCharCopyWith<$Res> {
  __$$_KanaCharCopyWithImpl(
      _$_KanaChar _value, $Res Function(_$_KanaChar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? char = null,
    Object? checkedDate = null,
  }) {
    return _then(_$_KanaChar(
      char: null == char
          ? _value.char
          : char // ignore: cast_nullable_to_non_nullable
              as String,
      checkedDate: null == checkedDate
          ? _value.checkedDate
          : checkedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_KanaChar extends _KanaChar {
  const _$_KanaChar({required this.char, required this.checkedDate})
      : super._();

  @override
  final String char;
  @override
  final DateTime checkedDate;

  @override
  String toString() {
    return 'KanaChar(char: $char, checkedDate: $checkedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KanaChar &&
            (identical(other.char, char) || other.char == char) &&
            (identical(other.checkedDate, checkedDate) ||
                other.checkedDate == checkedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, char, checkedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KanaCharCopyWith<_$_KanaChar> get copyWith =>
      __$$_KanaCharCopyWithImpl<_$_KanaChar>(this, _$identity);
}

abstract class _KanaChar extends KanaChar {
  const factory _KanaChar(
      {required final String char,
      required final DateTime checkedDate}) = _$_KanaChar;
  const _KanaChar._() : super._();

  @override
  String get char;
  @override
  DateTime get checkedDate;
  @override
  @JsonKey(ignore: true)
  _$$_KanaCharCopyWith<_$_KanaChar> get copyWith =>
      throw _privateConstructorUsedError;
}
