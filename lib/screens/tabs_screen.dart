import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../screens/Categories_list.dart';
import '../screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectePageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesList(),
        'title': 'Catégories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Vos Favoris',
      }
    ];
    super.initState();
  }

  void _selectePage(int index) {
    setState(() {
      _selectePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectePageIndex]['title ']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectePageIndex]['page '],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            onTap: _selectePage,
            unselectedItemColor: Colors.yellow,
            selectedItemColor: Colors.white,
            currentIndex: _selectePageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: ('Categories'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: ('Favoris'),
              ),
            ]));
  }
}
