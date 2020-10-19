import 'package:flutter/material.dart';
import 'package:restaurantapp/models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_Screen.dart';

class MainScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;
  const MainScreen(this._favoriteMeal);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> _pages;
  int selectedPage = 0;
  void selectedIndexPage(int selected) {
    setState(() {
      selectedPage = selected;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget._favoriteMeal), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[200],
        currentIndex: selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: selectedIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('favorite'),
          ),
        ],
      ),
      appBar: AppBar(
        //this
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          _pages[selectedPage]['title'],
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _pages[selectedPage]['page'],
    );
  }
}
