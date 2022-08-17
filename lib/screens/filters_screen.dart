import 'package:flutter/material.dart';
import 'package:travelling_guide/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
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
                  _summer,
                  (newValue) {
                    setState(
                      () {
                        _summer = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Winter Trips',
                  'Show Winter trips only',
                  _winter,
                  (newValue) {
                    setState(
                      () {
                        _winter = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Family Trips',
                  'Show Family trips only',
                  _family,
                  (newValue) {
                    setState(
                      () {
                        _family = newValue;
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
