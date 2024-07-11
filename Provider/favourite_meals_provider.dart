import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/filter_provider.dart';
import 'package:meals/Provider/provider.dart';
import 'package:meals/meal.dart';

//final favoruitemealsprovider = Provider((ref) => values_returned);--> This is used when data returend (values_returned) is static and doesn't change

class FavouritemealsNotifier extends StateNotifier<List<Meal>> {
  /*Usually we can edit an objects memory by adding(appending) to a list instead of assigning it.
  EXAMPLE:- var meals=['a','b','c']---->memory:0x26b92f
            meals =['a','b','c',d]----->memory:0x21a64d  since we are reassigning it.
  but we can meals.add('d') ---> then the  memory would be the same.
  After reassigning to the variable the old values will be automatically deleted from the memory
  DISCLAIMER:- a value can't be changed or reassigned in a StateNotifier class.
  so we cant .add() or .remove() from a list.
  */
  FavouritemealsNotifier() : super([]);
  /*we have made a constructor function with no arguments. Then we add an intializer list by using : .
  Then we use super() to reach the parent class [StateNotifier] and pass our intial data i,e an empty list.
  */

  bool favouriteMealsStatusprovider(Meal meal1) {
    //state is a global variable created by StateNotifier. It has the same data type as StateNotifier since its a generic class.
    final inlist = state.contains(meal1);
    if (inlist) {
      state = state.where((meal) => meal1.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal1];
      return true;
      //we are pulling all the objects from the list and adding them to a new list with the currently passed object i,e meal1. Everytime else is triggered a new list is created.
    }
  }
}

final favouritemealsprovider =
    StateNotifierProvider<FavouritemealsNotifier, List<Meal>>((ref) {
  return FavouritemealsNotifier();
});
/*This is used when data returned is dynamic in nature or dynamic values.
state notifier works with StateNotifier class & statenotifier class is a generic class i.e, it's data type has to be specified.
*/

final filterscreenprovider = Provider((ref) {
  final river_meals = ref.watch(mealsprovider);
  final activefilters = ref.watch(filtersProvider);
  return river_meals.where((meal) {
    if (activefilters[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activefilters[Filter.vegetatrian]! && !meal.isVegetarian == false) {
      return false;
      //we select the specific index i.e; .vegetarian of selectedfilter and ensure that it's set(either true or false) but not null !
      //The meals are only displayed if the meal has isVegetarian set to True else the if condition returns False.
    }
    if (activefilters[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
