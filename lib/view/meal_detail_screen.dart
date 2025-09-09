import 'package:bite_book/models/meals_model.dart';
import 'package:bite_book/screens/controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen({super.key, required this.meal1});
  final Meal meal1;

  final homeController = Get.find<NavBarController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              meal1.title,
              style: GoogleFonts.aBeeZee(fontSize: height * 0.02),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: meal1.id,
                child: Container(
                  height: height * 0.30,

                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(meal1.imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'How to make?',
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 220),
                    child: IconButton(
                      onPressed: () {
                        final addedfav = homeController
                            .toogleMealFavouriteStatus(meal1)
                            .value;
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              addedfav
                                  ? 'Added in Favourites'
                                  : 'Removed From Favourite',
                            ),
                          ),
                        );
                      },
                      icon: Obx(
                        () => homeController.favouriteMeal.contains(meal1)
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingrediants :',
                      style: GoogleFonts.aBeeZee(
                        color: const Color.fromRGBO(225, 172, 12, 1),
                        fontSize: height * 0.025,
                      ),
                    ),
                    Text(
                      (meal1.ingredients.join(' , ')),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: height * 0.019,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Recipe:',
                      style: GoogleFonts.aBeeZee(
                        color: const Color.fromARGB(255, 225, 172, 12),
                        fontSize: height * 0.025,
                      ),
                    ),
                    Text(
                      (meal1.steps.join(' , ')),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: height * 0.019,
                      ),
                    ),

                    MealDetailBoolRow(
                      booltext: 'Is Gluten Free',
                      height: height,
                      width: width * 0.1,
                      meal1: meal1,
                      mealBoolDetail: meal1.isGlutenFree,
                    ),
                    MealDetailBoolRow(
                      booltext: 'Is Lactose Free',
                      height: height,
                      width: width * 0.08,
                      meal1: meal1,
                      mealBoolDetail: meal1.isLactoseFree,
                    ),

                    MealDetailBoolRow(
                      booltext: 'Is Vegan',
                      height: height,
                      width: width * 0.25,
                      meal1: meal1,
                      mealBoolDetail: meal1.isVegan,
                    ),
                    MealDetailBoolRow(
                      booltext: 'Is Vegetarian',
                      height: height,
                      width: width * 0.13,
                      meal1: meal1,
                      mealBoolDetail: meal1.isVegetarian,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealDetailBoolRow extends StatelessWidget {
  const MealDetailBoolRow({
    super.key,
    required this.height,
    required this.width,
    required this.meal1,
    required this.booltext,
    required this.mealBoolDetail,
  });

  final double height;
  final double width;
  final Meal meal1;
  final String booltext;
  final bool mealBoolDetail;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          booltext,
          style: GoogleFonts.aBeeZee(
            color: const Color.fromARGB(255, 225, 172, 12),
            fontSize: height * 0.025,
          ),
        ),
        SizedBox(height: height * 0.05, width: width),
        mealBoolDetail
            ? Text(
                'Yes',
                style: GoogleFonts.aBeeZee(
                  color: Colors.green,
                  fontSize: height * 0.025,
                ),
              )
            : Text(
                'No',
                style: GoogleFonts.aBeeZee(
                  color: Colors.red,
                  fontSize: height * 0.025,
                ),
              ),
      ],
    );
  }
}
