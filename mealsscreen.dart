import 'package:flutter/material.dart';
import 'package:meals/item_data.dart';
import 'package:meals/meal.dart';
import 'package:meals/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    //required this.favouritemeals2898
  });
  final String? title;
  final List<Meal> meals;
  //final void Function(Meal meal) favouritemeals2898;

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Item_data(
          meal1: meal,
          //favouritemeals: favouritemeals2898,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((ctx, index) => MealItem(
              meal: meals[index],
              onselectmeal: (meal) {
                selectmeal(context, meal);
              },
            )));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('No Data',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            const SizedBox(
              height: 25,
            ),
            Text('Try Selecting another Category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ))
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title:
            Text(title!), //! is to declare that title can also have null value
      ),
      body: content,
    );
  }
}
