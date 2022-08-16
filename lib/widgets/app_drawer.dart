import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Your travelling Guide',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Trips',
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.filter_list,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
    String title,
    IconData icon,
    VoidCallback onTapLink,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }
}
