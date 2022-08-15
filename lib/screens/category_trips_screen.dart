// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripScreen extends StatelessWidget {
  static const screenRoute =
      '/category-trips'; // name of route page to be called in main without instantiating this class
  // final String CategoryId;
  // final String CategoryTitle;
  // const CategoryTripScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<
        String,
        String>; //get the id and title of the page and store them as map
    // ignore: non_constant_identifier_names
    final CategoryId = routeArgument['id'];
    // ignore: non_constant_identifier_names
    final CategoryTitle = routeArgument['title'];
    final filteredTrips = Trips_data.where(
      (trip) {
        return trip.categories.contains(CategoryId);
      },
    ).toList(); // test all the trips in trips_data if it containes the same catid that was passed in parameter will return true so add the trip to the finla liste
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
                title: filteredTrips[index].title,
                imageUrl: filteredTrips[index].imageUrl,
                duration: filteredTrips[index].duration,
                tripType: filteredTrips[index].tripType,
                season: filteredTrips[index].season);
          },
          itemCount: filteredTrips.length,
        ),
      ),
    );
  }
}
