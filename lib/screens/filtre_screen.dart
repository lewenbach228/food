import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltreScreen extends StatefulWidget {
  static const routeName = '/filtre';

  final Map<String, bool> actuelfiltre;
  final Function saveFiltre;

  FiltreScreen(this.actuelfiltre, this.saveFiltre);
  @override
  _FiltreScreenState createState() => _FiltreScreenState();
}

class _FiltreScreenState extends State<FiltreScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.actuelfiltre['gluten'];
    _lactoseFree = widget.actuelfiltre['lactose'];
    _vegan = widget.actuelfiltre['gluten'];
    _vegetarian = widget.actuelfiltre['gluten'];

    super.initState();
  }

  Widget _buildSwicthListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vos filtres'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFiltres = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFiltre(selectedFiltres);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Ajuster la selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwicthListTile(
                  'Gluten-Free',
                  'Only include Gluten free',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwicthListTile(
                  'Lactose-Free',
                  'Only include Lactose free',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwicthListTile(
                  'Vegetarian-Free',
                  'Only include Vegetarian free',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwicthListTile(
                  'Veagn-Free',
                  'Only include Veagn free',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
