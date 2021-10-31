import 'package:flutter/material.dart';

import './screens/filtre_screen.dart';
import './screens/meal_details.dart';
import './screens/categories_meals_list.dart';
import './screens/Categories_list.dart';
import './screens/tabs_screen.dart';
import './Dummy_data.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtres = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = Meal_Data;
  List<Meal> _favoriteMeal = [];

  void _setFiltres(Map<String, bool> filtreData) {
    setState(() {
      _filtres = filtreData;

      _availableMeals = Meal_Data.where((meal) {
        if (_filtres['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filtres['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filtres['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filtres['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.remove(existingIndex);
      });
    } else {
      _favoriteMeal.add(
        Meal_Data.firstWhere((meal) => meal.id == mealId),
      );
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Colors.pink,
            ),
            bodyText1: TextStyle(
              color: Colors.amberAccent,
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesList(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        CategoriesMeals.routeName: (ctx) => CategoriesMeals(_availableMeals),
        MealDetails.routeName: (ctx) =>
            MealDetails(_toggleFavorite, _isMealFavorite),
        FiltreScreen.routeName: (ctx) => FiltreScreen(_filtres, _setFiltres),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesList(),
        );
      },
    );
  }
}
