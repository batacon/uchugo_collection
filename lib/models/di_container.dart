import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchugo_collection/repositories/checked_chars_repository.dart';

final checkedCharsRepositoryProvider = Provider<CheckedCharsRepository>((ref) {
  return CheckedCharsRepository(SharedPreferences.getInstance());
});
