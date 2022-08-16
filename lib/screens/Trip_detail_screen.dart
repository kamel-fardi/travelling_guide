import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/Trip-detail-screen';
  Widget buildSectionTitle(BuildContext context, String text) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
  Widget buildListViewContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: child,
      );
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          selectedTrip.title,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedTrip.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildSectionTitle(context, 'Activities'),
          buildListViewContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 0.3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedTrip.activities[index]),
                ),
              ),
              itemCount: selectedTrip.activities.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildSectionTitle(context, 'Daily Program'),
          buildListViewContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Text('Day${index + 1}'),
                    ),
                    title: Text(selectedTrip.program[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedTrip.program.length,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
