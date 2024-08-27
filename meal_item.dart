import 'package:flutter/material.dart';
import 'package:foodtrac/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:foodtrac/widget/meal_item_trait.dart';
import 'package:foodtrac/widget/widget_meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) ontoggle;
  const MealItem({super.key, required this.meal, required this.ontoggle});
  String get compl {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get Affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  WidgetMeal(meal, ontoggle), // Navigate to WidgetMeal
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Evenly distribute the items
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} ',
                        ),
                        Container(
                          height:
                              24, // Adjust the height to balance with the content
                          child: VerticalDivider(
                            color: Colors.grey[
                                400], // Adds a separator line for better visual separation
                            thickness: 1,
                          ),
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: '$compl ',
                        ),
                        Container(
                          height: 24,
                          child: VerticalDivider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: Affordability,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
