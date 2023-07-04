import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return DUMMY_MEALS;
});
