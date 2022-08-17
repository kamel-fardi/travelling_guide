import 'package:flutter/material.dart';
import '../models/Trips.dart';
import '../widgets/app_drawer.dart';
import '../screens/favorites_screen.dart';

import 'categories_screen.dart';

class TabsScreen1 extends StatefulWidget {
  //const TabsScreen1({Key? key}) : super(key: key);
  final List<Trip> selectedFavoriteTrips;
  const TabsScreen1(this.selectedFavoriteTrips, {Key? key}) : super(key: key);
  @override
  State<TabsScreen1> createState() => _TabsScreen1State();
}

class _TabsScreen1State extends State<TabsScreen1> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  late List<Map<String, Object?>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'Trips Category',
      },
      {
        'Screen': FavoritesScreen(widget.selectedFavoriteTrips),
        'Title': 'Favorites',
      },
    ];
    super.initState();
  }

  //String title = ();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screens[_selectedScreenIndex]['Title'] as String),
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
