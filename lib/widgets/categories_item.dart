import 'package:flutter/material.dart';
import '../screens/categories_meals_list.dart';

class CategorieItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategorieItem(this.id, this.title, this.color);

  void selectCategorie(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMeals.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategorie(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
    );
  }
}
