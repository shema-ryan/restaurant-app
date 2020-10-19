import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget customListTile(
      BuildContext context, String title, IconData icon, String routeName) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      title: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      leading: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            'Filters',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              thickness: 0.3,
              color: Theme.of(context).primaryColor,
            ),
          ),
          customListTile(context, 'meals', Icons.restaurant, '/'),
          customListTile(
              context, 'filters', Icons.settings, FilterScreen.routeName),
        ],
      ),
    );
  }
}
