import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category - meals';
  final List<Meal> availableMeal;

  const CategoryMealScreen(this.availableMeal);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  bool isInitialDataLoaded = false;

  String title;
  List<dynamic> categoryMeals;

  @override
  void didChangeDependencies() {
    if (!isInitialDataLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final String id = routeArgs['id'];
      categoryMeals = widget.availableMeal
          .where((meal) => meal.categories.contains(id))
          .toList();
    }
    isInitialDataLoaded = true;
    super.didChangeDependencies();
  }

  void removeItem(String id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) => MealItem(
          title: categoryMeals[index].title,
          id: categoryMeals[index].id,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          duration: categoryMeals[index].duration,
          imageUrl: categoryMeals[index].imageUrl,
        ),
      ),
    );
  }
}
