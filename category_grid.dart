import 'package:flutter/material.dart';
import 'package:foodtrac/models/cat.dart';
import 'package:foodtrac/screens/meals.dart';
import 'package:foodtrac/data/dum.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(
      {super.key, required this.category, required this.onselect});
  final Category category;
  final void Function() onselect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
