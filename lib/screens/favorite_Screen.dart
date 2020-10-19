import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;
  FavoriteScreen(this._favoriteMeal);
  @override
  Widget build(BuildContext context) {
    return _favoriteMeal.isEmpty
        ? Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/man.jpg',
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
              Text('No favorite added '),
            ],
          )
        : ListView.builder(
            itemCount: _favoriteMeal.length,
            itemBuilder: (BuildContext context, int index) => MealItem(
              title: _favoriteMeal[index].title,
              id: _favoriteMeal[index].id,
              affordability: _favoriteMeal[index].affordability,
              complexity: _favoriteMeal[index].complexity,
              duration: _favoriteMeal[index].duration,
              imageUrl: _favoriteMeal[index].imageUrl,
            ),
          );
  }
}
