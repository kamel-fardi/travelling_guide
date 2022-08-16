import 'package:flutter/material.dart';
import 'package:travelling_guide/screens/Trip_detail_screen.dart';
import 'package:travelling_guide/screens/tabs_screen.dart';
import 'package:travelling_guide/screens/tabs_screen1.dart';
import './screens/categories_screen.dart';
import './screens/category_trips_screen.dart';

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
            const TabsScreen1(), //the same as home: const categoriesscreen(),
        CategoryTripScreen.screenRoute: (ctx) => CategoryTripScreen(),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
      },
    );
  }
}
