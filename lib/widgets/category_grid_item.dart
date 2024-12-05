import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

//category grid item widget stateless class
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {

    //return an inkwell widget
    return InkWell(
      //on tap event handler
      onTap: onSelectCategory,

      //splash color
      splashColor: Theme.of(context).primaryColor,

      //border radius
      borderRadius: BorderRadius.circular(16),

      child: Container(
        //padding for the container
        padding: const EdgeInsets.all(16),
        //decoration for the container
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),

            //gradient for the container
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            
            //text widget for the category title
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
