import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/favourite_meals_provider.dart';
import 'package:meals/meal.dart';

class Item_data extends ConsumerWidget {
  const Item_data({
    super.key,
    required this.meal1, //required this.favouritemeals
  });
  final Meal meal1;
  //final void Function(Meal meal) favouritemeals;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal1.title),
        actions: [
          IconButton(
            onPressed: () {
              final isadded = ref
                  .read(favouritemealsprovider.notifier)
                  .favouriteMealsStatusprovider(meal1);
              //we're accessing favouritemealsStatusprovider using .notifier on favouritemealsprovider
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isadded
                      ? 'Added to Favourites'
                      : 'Removed From Favourites'),
                  /* duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        favouriteMealsStatus(meal);
                      }), */
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal1.imageUrl),
            Text(
              ' Ingridients :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            for (final ingridients in meal1.ingredients)
              Text(
                ingridients,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Recipie :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final steps in meal1.steps)
              Text(
                steps,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
          ],
        ),
      ),
    );
  }
}
