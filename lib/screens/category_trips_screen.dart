// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/Trips.dart';
import '../widgets/trip_item.dart';

class CategoryTripScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  final List<Trip> availabelTrips;
  const CategoryTripScreen(this.availabelTrips);
  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  String? categoryTitle;
  late List<Trip> displayTrips;
  // name of route page to be called in main without instantiating this class
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<
        String,
        String>; //get the id and title of the page and store them as map
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'] as String;
    displayTrips = widget.availabelTrips.where(
      (trip) {
        // test all the trips in trips_data if it containes the same catid that was passed in parameter will return true so add the trip to the final liste
        return trip.categories.contains(categoryId);
      },
    ).toList();
    super.didChangeDependencies();
  }

  /*void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              id: displayTrips[index].id,
              title: displayTrips[index].title,
              imageUrl: displayTrips[index].imageUrl,
              duration: displayTrips[index].duration,
              tripType: displayTrips[index].tripType,
              season: displayTrips[index].season,
              // removeItem: _removeTrip,
            );
          },
          itemCount: displayTrips.length,
        ),
      ),
    );
  }
}
