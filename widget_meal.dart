import 'package:flutter/material.dart';
import 'package:foodtrac/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:foodtrac/widget/meal_item_trait.dart';
import 'package:foodtrac/screens/tabs.dart';

class WidgetMeal extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) ontoggle;
  const WidgetMeal(this.meal, this.ontoggle, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ontoggle(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ], // Display the meal title in the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Stretch content across the width
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              width: 25,
            ),
            Padding(padding: EdgeInsets.all(9)),
            Text(
              'Ingredient',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 14,
            ),
            Padding(padding: EdgeInsets.all(5)),
            for (final ing in meal.ingredients)
              Text(ing,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            for (final ing in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(ing,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              ),
          ],
        ),
      ),
    );
  }
}
