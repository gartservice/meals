import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/widgets/meal_item_trait.dart';
import 'package:meals/models/meal.dart';

//meal item stateless class
class MealItem extends StatelessWidget {

  //constructor for the meal item
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  //get the complexity text
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  //get the affordability text
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override

  //build method for the meal item
  Widget build(BuildContext context) {

    //return a card widget
    return Card(
      //margin for the card
      margin: const EdgeInsets.all(8),

      //shape for the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      //clip behavior for the card
      clipBehavior: Clip.hardEdge,
      elevation: 2,

      //inkwell widget for the card
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [

            //fade in image widget for the meal item
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),

            //positioned widget for the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,

                      //overflow text ellipsis
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    //spacing
                    const SizedBox(height: 12),
                    //row widget for the meal item
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //meal item trait for the meal minutes
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        //meal item trait for the meal complexity text
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        
                        //meal item trait for the meal affordability text
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
