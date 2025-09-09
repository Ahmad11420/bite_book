import 'package:bite_book/custom_widget/gridView.dart';
import 'package:bite_book/models/meals_model.dart';
import 'package:bite_book/screens/controller/nav_bar_controller.dart';
import 'package:bite_book/view/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Catagory extends StatefulWidget {
  const Catagory({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory>
    with SingleTickerProviderStateMixin {
  final homeController = Get.find<NavBarController>();
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _animationController,
              // builder: (BuildContext context, Widget? child) {  },
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 25,
                ),
                children: [
                  for (var catagory in homeController.availableCatagory)
                    Gridview(
                      category: catagory,
                      onSelectCatagory: () {
                        final filterdMeals = homeController.avaiableMeals
                            .where(
                              (Meal) => Meal.categories.contains(catagory.id),
                            )
                            .toList();
                        Get.to(() => MealsScreen(meals: filterdMeals.obs));
                      },
                    ),
                ],
              ),

              builder: (context, child) => SlideTransition(
                position: Tween(begin: Offset(0, -0.4), end: Offset(0, 0))
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
