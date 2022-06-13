import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category? _category;
  List<Meal>? _categoryMeals;
  var _isMealLoaded = false;

  // _removeMeal(mealId) {
  //   setState(() {
  //     _categoryMeals!.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isMealLoaded) {
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      _category = routeArgs['category'] as Category;
      _categoryMeals = widget.availableMeals
          .where(
            (meal) => meal.categories.contains(_category!.id),
          )
          .toList();
      _isMealLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category!.title),
      ),
      body: _categoryMeals!.isNotEmpty
          ? ListView(
              children: _categoryMeals!
                  .map(
                    (meal) => MealItem(
                      meal: meal,
                      // removeItem: _removeMeal,
                    ),
                  )
                  .toList(),
            )
          : Center(
              child: Text(
                'No Meals in this category',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
    );
  }
}
