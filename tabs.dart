import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/filter_provider.dart';
import 'package:meals/Provider/provider.dart';
import 'package:meals/categoryscreen.dart';
import 'package:meals/drawer.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/fliterscreen.dart';
import 'package:meals/meal.dart';
import 'package:meals/mealsscreen.dart';

const initialfilter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetatrian: false
};

class TabsScreen extends ConsumerStatefulWidget {
  //a spl. widget provided by riverpod package that has added fuctionalities that allow us to listen to all the changes in provider values.
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  //final List<Meal> favoritemeals = [];
  String activepagetitle = 'Home';

  // Map<Filter, bool> selectedfilter = initialfilter;

  /*  void showmsg(String message, Meal meal) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              favouriteMealsStatus(meal);
            }),
      ),
    );
  } */

  /* void favouriteMealsStatus(Meal meal) {
    final isExisting = favoritemeals.contains(
        meal); //returns true if favouritemeals list contains meal else returns false.
    if (isExisting == true) {
      setState(() {
        favoritemeals.remove(meal);
        showmsg('${meal.title} has been removed from favourites', meal);
      });
    } else {
      setState(() {
        favoritemeals.add(meal);
        showmsg('${meal.title} has been added to favourites', meal);
      });
    }
  }
 */
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      /* final result =  */ await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Filterscreen(),
          //we don't get any result from filtersscreen after providers have been added to the program.
        ),
      );
      /* setState(
        () {
          selectedfilter = result ??
              initialfilter; // ?? checks if the result is null or not, if it is null then the value of result is initialfilter.
          print('tabs result' + '${result}');
        },
      ); */
    }
  }

  @override
  Widget build(BuildContext context) {
    /* ref; it's similar to widget
    ref.read(provider) --> to get data from our provider
    red.watch() -->to setup a listner whenever our data changes.
    ref.listen(provider, (previous, next) { }) */

    final availablemeals = ref.watch(filtersProvider);
    /*final river_meals = ref.watch(mealsprovider);
    final activefilters = ref.watch(filtersProvider);
    final avaliablemeals =  river_meals.where((meal) {
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
    }).toList(); */

    Widget activePage = categoryscreen(
      //favouritemeals3000: favouriteMealsStatus,
      mealsavailable123: availablemeals,
    );

    if (_selectedPageIndex == 1) {
      activepagetitle = 'Favourites';
      activePage = MealsScreen(
        meals: availablemeals,
        //favouritemeals2898: favouriteMealsStatus,
      );
    } else {
      activepagetitle = 'Home';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(onselectscreen: setscreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
