import 'package:flutter/material.dart';
import 'package:foodtrac/widget/category_grid.dart';
import 'package:foodtrac/data/dum.dart';
import 'package:foodtrac/screens/meals.dart';
import 'package:foodtrac/models/cat.dart';

import 'package:foodtrac/models/meal.dart';

class CategoriesCla extends StatelessWidget {
  const CategoriesCla(
      {super.key, required this.ontoggle, required this.availble});
  final void Function(Meal meal) ontoggle;
  final List<Meal> availble;
  void _sel(BuildContext context, Category category) {
    final filt = availble
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
                meals: filt,
                title: category.title,
                ontoggle: ontoggle,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (var i = 0; i < availableCategories.length; i++)
          (CategoryGrid(
            category: availableCategories[i],
            onselect: () {
              _sel(context, availableCategories[i]);
            },
          ))
      ],
    );
  }
}
