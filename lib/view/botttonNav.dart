import 'package:bite_book/view/catagory.dart';
import 'package:bite_book/screens/controller/nav_bar_controller.dart';
import 'package:bite_book/view/favourite_meals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Botttonnav extends StatefulWidget {
  const Botttonnav({super.key});

  @override
  State<Botttonnav> createState() => _BotttonnavState();
}

class _BotttonnavState extends State<Botttonnav> {
  final NavBarController navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Widget activeScreen = Catagory(
        availableMeals: navBarController.avaiableMeals,
      );
      if (navBarController.currindex.value == 1) {
        activeScreen = FavouriteMeals(favmeals: navBarController.favouriteMeal);
      }
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: navBarController.currentPage,
          currentIndex: navBarController.currindex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Catagory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
          ],
        ),
        body: activeScreen,
      );
    });
  }
}
