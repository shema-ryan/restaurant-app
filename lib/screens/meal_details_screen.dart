import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function _toggleFavorite;
  final Function _isFavorite;
  static const String routeName = '/meal-details ';
  const MealDetailsScreen(this._toggleFavorite, this._isFavorite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            // ignore: deprecated_member_use
            .title
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String routeArgsId =
        ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgsId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              height: 400,
              width: double.infinity,
              child: Hero(
                tag: selectedMeal.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // ignore: deprecated_member_use
            buildSectionTitle(context, 'Ingredients'),
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text('${selectedMeal.steps[index]}'),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 2.0,
                        thickness: 1.0,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop(routeArgsId);
          // ignore: unnecessary_statements
          _toggleFavorite(routeArgsId);
        },
        child: _isFavorite(routeArgsId)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
