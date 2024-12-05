import 'package:flutter/material.dart';

//meal item trait stateless class
class MealItemTrait extends StatelessWidget {

  //constructor for the meal item trait
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override

  //build method for the meal item trait
  Widget build(BuildContext context) {
    
    return Row(children: [
      //icon for the meal item trait
      Icon(
        icon,
        size: 17,
        color: Colors.white,
      ),
      const SizedBox(width: 6),
      //text widget for the meal item trait
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ]);
  }
}
