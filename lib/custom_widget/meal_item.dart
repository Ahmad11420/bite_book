import 'package:bite_book/custom_widget/row_in_mealitems.dart';
import 'package:bite_book/models/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 27),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.brown.withValues(alpha: 0.7),
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: width * 0.03),

                        RowInMealitems(
                          text: '${meal.duration} min',
                          icon: Icons.schedule,
                        ),
                        SizedBox(width: width * .07),
                        RowInMealitems(
                          text: meal.complexity.name,
                          icon: Icons.extension,
                        ),
                        SizedBox(width: width * .07),
                        RowInMealitems(
                          text: meal.affordability.name,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.04,
              decoration: BoxDecoration(
                color: Colors.brown.withValues(alpha: 0.8),
              ),
              child: Center(
                child: Text(
                  meal.title,
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: const Color.fromARGB(255, 242, 240, 240),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
