import 'package:flutter/material.dart';
import 'package:travelling_guide/screens/categories_screen.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  //const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tourist Guide'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          const FavoritesScreen(),
        ]),
      ),
    );
  }
}
