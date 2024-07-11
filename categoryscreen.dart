import 'package:flutter/material.dart';
import 'package:meals/category.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/gridviewitem.dart';
import 'package:meals/meal.dart';
import 'package:meals/mealsscreen.dart';

class categoryscreen extends StatelessWidget {
  const categoryscreen({
    super.key,
    //required this.favouritemeals3000,
    required this.mealsavailable123,
  });

  //final void Function(Meal meal) favouritemeals3000;
  final List<Meal> mealsavailable123;

  void _selectcategory(BuildContext context, Category category) {
    final filteredmeals = mealsavailable123
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    /* Navigator.push(context,route); */ //Route is a widget to be displayed. In flutter the screens are stacked upon each other in a stack
    //the topmost layer is visible to the user & that is why when we use Navigator.pop() it pops the top layer in the stack.

    /* Navigator.of(context).push(route); --> This is same as Navigator.push(context,route); but (BuildContext context) isn't declared in the parameters.*/
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredmeals,
          //favouritemeals2898: favouritemeals3000,
        ),
      ),
    ); //Builder requires a function that returns a widget to be displayed and the function
    //recieves a context value as parameter.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your Category'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          //To display grid view ''ly like list view
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //No of children to be display side by side
              childAspectRatio: 1.5, //Ratio of crossAxisSpacing:mainAxisSpacing
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          /* MainAxis is the axis for the Widget in which it is supposed to scroll.
            CrossAxis is the one which is perpendicular to MainAxis. */
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category1: category,
                fns: () {
                  _selectcategory(context, category);
                },
              )
          ],
        ));
  }
}
