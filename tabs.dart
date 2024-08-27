import 'package:flutter/material.dart';
import 'package:foodtrac/categories.dart';
import 'package:foodtrac/data/dum.dart';
import 'package:foodtrac/models/meal.dart';
import 'package:foodtrac/screens/meals.dart';
import 'package:foodtrac/widget/main_drawer.dart';
import 'package:foodtrac/screens/filters.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _selectedPage = 0;
  final List<Meal> fav = [];
  Map<Filter, bool> _selected = {
    Filter.gluten: false,
    Filter.lactos: false,
    Filter.veget: false,
    Filter.vegan: false,
  };

  void _select(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _setScreen(String ident) async {
    Navigator.of(context).pop();
    if (ident == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => Filtersesc()),
      );
      setState(() {
        _selected = result ??
            {
              Filter.gluten: false,
              Filter.lactos: false,
              Filter.veget: false,
              Filter.vegan: false,
            };
      });
    }
  }

  void _show(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void addIntoFave(Meal meal) {
    final isFavorite = fav.contains(meal);
    setState(() {
      if (isFavorite) {
        fav.remove(meal);
        _show('Meal is no longer a FAVORITE');
      } else {
        fav.add(meal);
        _show('Meal is a FAVORITE');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final availble = dummyMeals.where((meal) {
      if (_selected[Filter.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selected[Filter.lactos]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selected[Filter.vegan]! && !meal.isVegetarian) {
        return false;
      }
      if (_selected[Filter.veget]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeWidget = CategoriesCla(
      ontoggle: addIntoFave,
      availble: availble,
    );
    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      activeWidget = MealsScreen(
        meals: fav,
        ontoggle: addIntoFave,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onselect: _setScreen,
      ),
      body: activeWidget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _select,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
