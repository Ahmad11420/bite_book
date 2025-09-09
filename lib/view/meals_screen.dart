import 'package:bite_book/custom_widget/meal_item.dart';
import 'package:bite_book/models/meals_model.dart';
import 'package:bite_book/view/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals});
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
   // final width = MediaQuery.of(context).size.width;

    Widget content = Center(
      child: Column(
        children: [
          Text('Meal are not present '),
          SizedBox(height: height * 0.05),
          Text('Try Again'),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) { 
          return MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              Get.to(() => MealDetailScreen(meal1: meal));
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Meals', style: TextStyle(color: Colors.white)),
      ),
      body: content,
    );
  }
}
