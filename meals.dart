import 'package:flutter/material.dart';
import 'package:foodtrac/models/meal.dart';
import 'package:foodtrac/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, required this.meals, this.title, required this.ontoggle});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) ontoggle;

  @override
  Widget build(BuildContext context) {
    Widget con = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          print(meals[index].title);
          return MealItem(
            meal: meals[index],
            ontoggle: ontoggle,
          );
        });
    if (meals.isEmpty) {
      con = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... nothing here'),
            SizedBox(
              height: 16,
            ),
            Text('try another category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))
          ],
        ),
      );
    }
    if (title == null) {
      return con;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: con,
    );
  }
}
