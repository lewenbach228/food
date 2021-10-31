import 'package:flutter/material.dart';

import '../widgets/categories_item.dart';
import '../Dummy_data.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delicious Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: Categories_Data.map(
          (value) => CategorieItem(
            value.id,
            value.title,
            value.color,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
