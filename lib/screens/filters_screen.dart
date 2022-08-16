import 'package:flutter/material.dart';
import 'package:travelling_guide/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    var currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Filtered Trips'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Summer Trips',
                  'Show summer trips only',
                  _isInSummer,
                  (newValue) {
                    setState(
                      () {
                        _isInSummer = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Winter Trips',
                  'Show Winter trips only',
                  _isInWinter,
                  (newValue) {
                    setState(
                      () {
                        _isInWinter = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Family Trips',
                  'Show Family trips only',
                  _isForFamily,
                  (newValue) {
                    setState(
                      () {
                        _isForFamily = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
