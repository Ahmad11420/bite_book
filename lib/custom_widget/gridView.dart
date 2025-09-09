import 'package:bite_book/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gridview extends StatelessWidget {
  const Gridview({
    super.key,
    required this.category,
    required this.onSelectCatagory,
  });

  final Category category;
  final void Function() onSelectCatagory;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //  final homeController = Get.find<NavBarController>();
    return InkWell(
      onTap: onSelectCatagory,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 10),
            child: Container(
              height: height * 0.32,
              width: width * 0.44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(71),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  colors: [
                    category.color.withValues(alpha: .4),
                    category.color.withValues(alpha: .9),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      category.title,
                      style: GoogleFonts.aBeeZee(
                        color: category.txtColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140),
            child: Image(
              width: width * 0.23,
              height: height * 0.1,
              image: AssetImage(category.image),
            ),
          ),
        ],
      ),
    );
  }
}
