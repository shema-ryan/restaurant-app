import 'package:flutter/material.dart';
import 'package:restaurantapp/models/dummy_data.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/main_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };
  List<Meal> _filteredMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void selectedFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _filteredMeal = DUMMY_MEALS.where((availableMeal) {
        if (_filters['isGlutenFree'] && !availableMeal.isGlutenFree) {
          return false;
        }
        if (_filters['isLactoseFree'] && !availableMeal.isLactoseFree) {
          return false;
        }
        if (_filters['isVegan'] && !availableMeal.isVegan) {
          return false;
        }
        if (_filters['isVegetarian'] && !availableMeal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    int existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli meals ',
      theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.brown,
          accentColor: Colors.brown,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                body1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1), fontSize: 18.0),
                // ignore: deprecated_member_use
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                // ignore: deprecated_member_use
                title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22.0,
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(_favoriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_filteredMeal),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_toggleFavorite, isFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(selectedFilters, _filters),
      },
      // just in case a route in table fail then on generated route will be loaded
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
