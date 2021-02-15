import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThermostatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Thermostat();
  }
}

class Thermostat extends StatefulWidget {
  Thermostat({Key key}) : super(key: key);
  @override
  _ThermostatState createState() => _ThermostatState();
}

class _ThermostatState extends State<Thermostat> {
  Slots _slots;

  void _setSlots(Slots slots) {
    setState(() {
      _slots=slots;
    });
  }

  void _sendSlots() {
    if (_slots!=null) {
      print(_slots.value);
      send(_slots.value);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThermostatList(updateSlots: _setSlots),
      floatingActionButton: ThermostatButton(sendSlots: _sendSlots)
    );
  }
}

class ThermostatList extends StatelessWidget {
  final updateSlots;

  const ThermostatList({this.updateSlots});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ...slots.map((d) => ThermostatTile(
            slots: d,
            updateSlots: updateSlots,
          )),
        ],
      ),
    );
  }
}

class ThermostatTile extends StatelessWidget {
  final Slots slots;
  final updateSlots;

  ThermostatTile({this.slots, this.updateSlots});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(slots.name),
      onTap: () {
        updateSlots(slots);
      },
    );
  }
}

class ThermostatButton extends StatelessWidget {
  final sendSlots;

  ThermostatButton({this.sendSlots});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          sendSlots();
        },
        tooltip: 'Send',
        child: Icon(Icons.send)
    );
  }
}

class Slots {
  final String name;
  final String value;

  const Slots({this.name, this.value});
}

final slots = [
  Slots(name: 'Arrêt', value: 'A'),
  Slots(name: 'Forcé', value: 'B'),
];


Future<String> send(slots) async {
  final response = await http.post('http://10.0.2.2:5001/test/' + slots);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(jsonDecode(response.body));
    print('OK');
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
