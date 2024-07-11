import 'package:flutter/material.dart';
import 'package:meals/meal.dart';
import 'package:meals/trait.dart';

import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onselectmeal});
  final Meal meal;
  final void Function(Meal meal) onselectmeal;

  String get complexitytext {
    return meal.complexity.name[0]
            .toUpperCase() + //converts the first letter to uppercase
        meal.complexity.name
            .substring(1); //added to rest of the string being returned.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation:
            2, //Gives 3d like feel to the image by elevating it to n pixels.
        clipBehavior: Clip
            .hardEdge, //Usually the borderradius,shape and margin are ignored by stack. To enforce them onto stack we use Clip.hardedge
        child: InkWell(
          onTap: () {
            onselectmeal(meal);
          },
          child: Stack(
            //In a stack the first widget will be placed at the botton while the upcomimng widgets are placed upon each other.
            //We can stack widgets on top of each other.
            children: [
              FadeInImage(
                //when image is loaded,its not popping in but slowly fades in.
                placeholder: MemoryImage(
                  kTransparentImage,
                ), //Placeholder loads an image before the actual image is displayed with as smooth transition.
                image: NetworkImage(
                  meal.imageUrl,
                ), //NetworkImage displays an internet image using an URL.
                fit: BoxFit
                    .cover, //This is to ensure that if the img isnt large, it is zoomed in and to adjust to a box size.
                height: 150,
                width: double
                    .infinity, //These dimensions are used by fit to ensure correct fitting.
              ),
              Positioned(
                //These coordinates are in place to check its position
                bottom: 0,
                left: 0,
                right: 50,
                //These coordinates say that the image should be positioned from left border till right border of 50 pixels before FadeinImage is displayed.
                //top: 0,
                child: Container(
                  color: Colors.black54, //Transparent variant of black color,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2, //Restricts text to max of 2 lines.
                        textAlign: TextAlign.center,
                        softWrap: true, //Wraps text if needed
                        overflow: TextOverflow
                            .ellipsis, //When the text exceeds max lines length then it is displayed in an elliptical style(...)
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Usually a row inside a column leads to error but since it's inside positioned Widget and has left,right,top,bottom parameters;its accpeted
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 10,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: complexitytext),
                          const SizedBox(
                            width: 10,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: '${meal.affordability}')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
