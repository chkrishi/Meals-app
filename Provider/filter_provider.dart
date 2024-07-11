import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegan,
  vegetatrian,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegetatrian: false,
        });

  void setFilter(Filter filter, bool isactive) {
    //state[filiter] = isActive; isn't allowed as we are mutating the map not reassingning it.
    state = {
      ...state, //this copies the old state values to the newly reassigned state using ... operator along with filter {key value}.
      filter: isactive,
    };
  }

  void resetfilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
