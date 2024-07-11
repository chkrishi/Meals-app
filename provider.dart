import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/dummy_data.dart';

final mealsprovider = Provider((ref1) {
  return dummyMeals;
});
