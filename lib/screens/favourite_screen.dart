import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen(this.favMeals, {Key? key}) : super(key: key);

  final List<Meal> favMeals;

  @override
  Widget build(BuildContext context) {
    return favMeals.isEmpty
        ? Center(
            child: Text(
              'Add meals to your favourites list',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemCount: favMeals.length,
            itemBuilder: (ctx, index) => MealItem(meal: favMeals[index]),
          );
  }
}
