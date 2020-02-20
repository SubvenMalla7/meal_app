import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';

import 'package:mealapp/widgets/widgets/meal_item.dart';



class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealScreen( this.availableMeals) ;

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isLoaded = false;

  @override
  void initState() {
    // 
    //...
    super.initState();
  }
  void didChangeDependencies() {
    if (!isLoaded){
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    isLoaded=true;
  }
    super.didChangeDependencies();
  }

  void _itemRemoved(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal)=> meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
