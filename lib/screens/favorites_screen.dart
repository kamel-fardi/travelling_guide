import 'package:flutter/material.dart';

import '../models/Trips.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);
  final List<Trip> favoritesTrip;
  const FavoritesScreen(this.favoritesTrip, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (favoritesTrip.isEmpty) {
      return const Center(
        child: Text('You have no favorites Trips For now'),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              id: favoritesTrip[index].id,
              title: favoritesTrip[index].title,
              imageUrl: favoritesTrip[index].imageUrl,
              duration: favoritesTrip[index].duration,
              tripType: favoritesTrip[index].tripType,
              season: favoritesTrip[index].season,
              //removeItem: _removeTrip,
            );
          },
          itemCount: favoritesTrip.length,
        ),
      );
    }
  }
}
