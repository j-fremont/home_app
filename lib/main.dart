import 'package:flutter/material.dart';

import 'thermostat_page.dart';
import 'test_page.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.ac_unit),
                  text: 'Thermostat',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'Test',
                ),
              ],
            ),
            title: Text('Home'),
          ),
          body: TabBarView(
            children: [
              ThermostatPage(),
              TestPage(),
            ],
          ),
        ),
      ),
    );
  }
}
