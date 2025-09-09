import 'package:bite_book/custom_widget/meal_item.dart';
//import 'package:bite_book/models/favmeals_model.dart';
import 'package:bite_book/models/meals_model.dart';
import 'package:bite_book/view/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteMeals extends StatelessWidget {
  const FavouriteMeals({super.key, required this.favmeals});
  final List<Meal> favmeals;

  @override
  Widget build(BuildContext context) {
    // final favfavmeals = Get.find<NavBarController>();
    final height = MediaQuery.of(context).size.height;
  //  final width = MediaQuery.of(context).size.width;

    Widget content = Center(
      child: Column(
        children: [
          Text('Add Meals to Favourite '),
          SizedBox(height: height * 0.05),
          Text('Come Back Later'),
        ],
      ),
    );

    if (favmeals.isNotEmpty) {
      content = ListView.builder(
        itemCount: favmeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: favmeals[index],
            onSelectMeal: (meal) {
              Get.to(() => MealDetailScreen(meal1: meal));
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Favourite Meals', style: TextStyle(color: Colors.white)),
      ),
      body: content,
    );
  }
}
