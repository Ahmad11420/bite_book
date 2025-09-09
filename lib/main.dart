import 'package:bite_book/view/botttonNav.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 154, 91, 68),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: const Color.fromARGB(255, 240, 162, 162),
    displayColor: const Color.fromARGB(255, 75, 207, 27),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: Botttonnav(),
    );
  }
}
