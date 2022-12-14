// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const categoriesscreen({Key? key}) : super(key: key);
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Center(child: Center(child: const Text('Tourist Guide'))),
      ),*/
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Categories_data.map(
          // ignore: non_constant_identifier_names
          (CategoryData) => CategoryItem(
            CategoryData.id,
            CategoryData.title,
            CategoryData.imageUrl,
          ),
        ).toList(),
      ),
    );
  }
}
