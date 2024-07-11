import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/filter_provider.dart';
import 'package:meals/drawer.dart';
import 'package:meals/tabs.dart';

class Filterscreen extends ConsumerWidget
//converted to ConusmerWidget from ConsumerStatefulWidget..so the following changes are made.
{
  const Filterscreen({
    super.key, //required this.currentfilters
  });
  //final Map<Filter, bool> currentfilters;

/*   @override
  ConsumerState<Filterscreen> createState() {
    return _FilterscreenState();
  }
}

class _FilterscreenState extends ConsumerState<Filterscreen> {
  var glutenfreefilter = false;
  var lactosefreefilter = false;
  var vegfreefilter = false;
  var veganfreefilter = false;

  @override
  void initState() {
    super.initState();
    final activefilters = ref.read(filtersProvider);
    glutenfreefilter = activefilters[Filter.glutenfree]!;
    lactosefreefilter = activefilters[Filter.lactosefree]!;
    veganfreefilter = activefilters[Filter.vegan]!;
    vegfreefilter = activefilters[Filter.vegetatrian]!;
    ___________________________________________________________________
    /*  glutenfreefilter = widget.currentfilters[Filter.glutenfree]!;
    lactosefreefilter = widget.currentfilters[Filter.lactosefree]!;
    veganfreefilter = widget.currentfilters[Filter.vegan]!;
    vegfreefilter = widget.currentfilters[Filter.vegetatrian]!; */
  }
 */
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filtersProvider);
    //watch set's up a listner that re executes the build method whenever the state in the provider changes
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      /*  drawer: MainDrawer(------------>If not commented then errors in the code.
        onselectscreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).pop();
            /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const TabsScreen()),
              ),
            ); */
            /*  Navigator.of(context).pushReplacement(
              //This doesn't stack new screens on top but redirects to the old active screen.
              MaterialPageRoute(
                builder: (ctx) => const TabsScreen(),
              ),
            ); */
          }
        },
      ), */
      body: /* PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          } else {
            ref.read(filtersProvider.notifier).resetfilters({
              Filter.glutenfree: glutenfreefilter,
              Filter.lactosefree: lactosefreefilter,
              Filter.vegan: veganfreefilter,
              Filter.vegetatrian: vegfreefilter
            }); Navigator.of(context).pop({
               Filter.glutenfree: glutenfreefilter,
              Filter.lactosefree: lactosefreefilter,
              Filter.vegan: veganfreefilter,
              Filter.vegetatrian: vegfreefilter 
            }); 
            print('yolo' +
                '${glutenfreefilter}' +
                '${lactosefreefilter}' +
                '${veganfreefilter}' +
                '${veganfreefilter}');
          }
        },*/
          Column(
        children: [
          SwitchListTile(
            value: activefilters[Filter.glutenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenfree, ischecked);
              /* setState(() {
                glutenfreefilter = ischecked;
              }); */
            },
            title: Text(
              'Gluten Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Gluten Free Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor:
                Colors.blue.shade600, //Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          //_______________________________________________________________________________________________
          SwitchListTile(
            value: activefilters[Filter.lactosefree]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosefree, ischecked);
              /* setState(() {
                lactosefreefilter = ischecked;
              }); */
            },
            title: Text(
              'Lactose Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Lactose tolerant Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.white, //Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          //_______________________________________________________________________________________________
          SwitchListTile(
            value: activefilters[Filter.vegetatrian]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetatrian, ischecked);
              /* setState(() {
                vegfreefilter = ischecked;
              }); */
            },
            title: Text(
              'Vegetarian Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Veg Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor:
                Colors.green.shade700, //Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          //_______________________________________________________________________________________________
          SwitchListTile(
            value: activefilters[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, ischecked);
              /* setState(() {
                veganfreefilter = ischecked;
              }); */
            },
            title: Text(
              'Vegan Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Vegan Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors
                .orange.shade600, //Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
