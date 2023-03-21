import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider.family.autoDispose<DateTime, DateTime?>((ref, checkedDate) {
  return checkedDate ?? DateTime.now();
});
