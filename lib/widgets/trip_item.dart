import 'package:flutter/material.dart';
import '../models/Trips.dart';
import '../screens/Trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;
  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.removeItem,
  });
  String get seasonText {
    switch (season) {
      case Season.Summer:
        return 'Summer';
      case Season.Spring:
        return 'Spring';
      case Season.Winter:
        return 'Winter';
      case Season.Autumn:
        return 'Autumn';
      default:
        return 'Other';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'Activites';
      case TripType.Exploration:
        return 'Exploration';
      case TripType.Recovery:
        return 'Recovery';
      case TripType.Therapy:
        return 'Therapy';
      default:
        return 'Other';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          TripDetailScreen.screenRoute,
          arguments: id,
        )
        .then(
          //then here wil containe the variable that was passed in the pop function in trip detail screen that's was a futur var
          //this wil be exucted when the pushname is over aka the next page was closed
          (result) => {
            if (result != null)
              {
                removeItem(result),
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [
                        0.6, //top limit
                        1, //bottom limit
                      ],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow
                        .fade, //if the length of text >than his container it will be hided
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration days'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
