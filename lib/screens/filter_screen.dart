import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Function savedFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.savedFilters, this.currentFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegetarian = false;
  bool vegan = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['isGlutenFree'];
    lactoseFree = widget.currentFilters['isLactoseFree'];
    vegetarian = widget.currentFilters['isVegetarian'];
    vegan = widget.currentFilters['isVegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              'Adjust According to your preference',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SwitchListTile(
            title: Text(
              'Gluten_free',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text('Only include Gluten free meals.',
                style: TextStyle(fontSize: 15)),
            value: glutenFree,
            onChanged: (newValue) {
              setState(() {
                glutenFree = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Lactose_free',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text('Only include Lactose free meals.',
                style: TextStyle(fontSize: 15)),
            value: lactoseFree,
            onChanged: (newValue) {
              setState(() {
                lactoseFree = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Is_vegan',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text('Only include Vegan meals.',
                style: TextStyle(fontSize: 15)),
            value: vegan,
            onChanged: (newValue) {
              setState(() {
                vegan = newValue;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text('Only include Vegetarian meal',
                style: TextStyle(fontSize: 15)),
            value: vegetarian,
            onChanged: (newValue) {
              setState(() {
                vegetarian = newValue;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            child: RaisedButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Map<String, bool> filteredSelection = {
                    'isGlutenFree': glutenFree,
                    'isLactoseFree': lactoseFree,
                    'isVegan': vegan,
                    'isVegetarian': vegetarian,
                  };
                  widget.savedFilters(filteredSelection);
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text('Save')),
          ),
        ],
      ),
    );
  }
}
