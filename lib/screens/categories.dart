import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';

//categories screen widget
class CategoriesScreen extends StatelessWidget {
  
  //constructor for the categories screen
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  //final fields for the class constructor
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  //method to select a category
  void _selectCategory(BuildContext context, Category category) {

    //filter the meals based on the selected category
    final filteredMeals = availableMeals
        //return a new list of meals that contain the selected category
        .where((meal) => meal.categories.contains(category.id))

        //convert the iterable to a list
        .toList();

    //navigate to the meals screen
    Navigator.of(context).push(
      MaterialPageRoute(

        //pass the selected category and filtered meals to the meals screen
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    //return a grid view of the available categories
    return GridView(
      //padding for the grid view
      padding: const EdgeInsets.all(24),

      //grid view delegate
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        //loop through the available categories
        for (final category in availableCategories)

          //return a category grid item for each category
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              //select the category when it is tapped
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
