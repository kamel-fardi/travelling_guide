import 'package:flutter/material.dart';
import 'package:travelling_guide/screens/categories_screen.dart';
import 'package:travelling_guide/screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
      ),
      //home: const categoriesscreen(),
      routes: {
        '/': (ctx) =>
            const categoriesscreen(), //the same as home: const categoriesscreen(),
        CategoryTripScreen.screenRoute: (ctx) => CategoryTripScreen(),
      },
    );
  }
}
