import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onselectscreen,
  });
  final void Function(String identifier) onselectscreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up !',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            //Used to display multiple items as a list.
            leading: Icon(
              //leading is used to display the foremost element in the listtitle
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            title: Text(
              'meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 24),
            ),
            onTap: () {
              onselectscreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            title: Text(
              'filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 24),
            ),
            onTap: () {
              onselectscreen('filters');
            },
          )
        ],
      ),
    );
  }
}
