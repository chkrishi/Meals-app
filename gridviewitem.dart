import 'package:flutter/material.dart';
import 'package:meals/category.dart';

//Don't import foundation.dart as it contains boilercode for Category while category.dart also contains it but in the form of a class.
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category1, required this.fns
      /* required Category */
      });
  final Category category1;
  final void Function() fns;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fns,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(60),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category1.color.withOpacity(0.55),
              category1.color.withOpacity(0.35)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category1.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
    );
  }
}
