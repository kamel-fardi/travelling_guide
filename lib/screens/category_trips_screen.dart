import 'package:flutter/material.dart';
import 'package:travelling_guide/models/category.dart';

class CategoryTripScreen extends StatelessWidget {
  // final String CategoryId;
  // final String CategoryTitle;
  // const CategoryTripScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<
        String,
        String>; //get the id and title of the page and store them as map
    final CategoryId = routeArgument['id'];
    final CategoryTitle = routeArgument['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle!),
      ),
      body: const Center(
        child: Text('Trips list of this category'),
      ),
    );
  }
}
