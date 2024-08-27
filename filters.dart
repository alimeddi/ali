import 'package:flutter/material.dart';
import 'package:foodtrac/screens/tabs.dart';
import 'package:foodtrac/widget/main_drawer.dart';

class Filtersesc extends StatefulWidget {
  const Filtersesc({super.key});
  @override
  State<Filtersesc> createState() {
    return _FiltersecState();
  }
}

enum Filter {
  gluten,
  lactos,
  veget,
  vegan,
}

var _gluteenfree = false;
var _lactosfree = false;
var _vegfree = false;
var _vigfree = false;

class _FiltersecState extends State<Filtersesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //drawer: MainDrawer(onselect: (ident) {
      // Navigator.of(context).pop();
      // if (ident == 'meals') {
      // Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (ctx) => Tabs()));
      // }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.gluten: _gluteenfree,
            Filter.lactos: _lactosfree,
            Filter.veget: _vegfree,
            Filter.vegan: _vigfree,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluteenfree,
              onChanged: (ischeck) {
                setState(() {
                  _gluteenfree = ischeck;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosfree,
              onChanged: (ischeck) {
                setState(() {
                  _lactosfree = ischeck;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              subtitle: Text(
                'Only include Lactos-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegfree,
              onChanged: (ischeck) {
                setState(() {
                  _vegfree = ischeck;
                });
              },
              title: Text(
                'Vegeterien-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              subtitle: Text(
                'Only include Vegeterien-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vigfree,
              onChanged: (ischeck) {
                setState(() {
                  _vigfree = ischeck;
                });
              },
              title: Text(
                'vegan-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              subtitle: Text(
                'Only include vegen-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
