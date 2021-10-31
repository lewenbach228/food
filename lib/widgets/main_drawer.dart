import 'Package:flutter/material.dart';
import '../screens/filtre_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    IconData icon,
    String title,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.green,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            Icons.settings,
            'Filtres',
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltreScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
