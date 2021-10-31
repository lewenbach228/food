import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoriesMeals extends StatelessWidget {
  static const routeName = '/categories-meals-list';

  final List<Meal> availableMeal;
  CategoriesMeals(this.availableMeal);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorieTitle = routeArgs['title'];
    final categorieId = routeArgs['id'];
    final categorieMeals = availableMeal.where((meal) {
      return meal.categories.contains(categorieId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorieTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categorieMeals[index].id,
            title: categorieMeals[index].title,
            imageUrl: categorieMeals[index].imageUrl,
            duration: categorieMeals[index].duration,
            affordability: categorieMeals[index].affordability,
            complexity: categorieMeals[index].complexity,
          );
        },
        itemCount: categorieMeals.length,
      ),
    );
  }
}
