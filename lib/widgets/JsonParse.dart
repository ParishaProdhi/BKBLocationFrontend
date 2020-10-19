import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/nav-drawer.dart';

import 'Services.dart';
import 'locations.dart';
import 'map.dart';

class JsonParse extends StatefulWidget {
  final id;
  JsonParse(this.id);
  @override
  _JsonParseState createState() => _JsonParseState(id);
}

class _JsonParseState extends State<JsonParse> {
  List<Location> _locations;
  bool _loading;

  _JsonParseState(final id);

  @override
  void initState() {
    super.initState();
    _loading = true;
    // print(id);
    Services.getLocations(id).then((locations) {
      setState(() {
        _locations = locations;
        // print(_locations);
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : "Addresses"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _locations ? 0 : _locations.length,
          itemBuilder: (context, index) {
            Location location = _locations[index];
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.address),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('GET LIVE LOCATION'),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyMap(
                                      location.lattitude, location.longitude))),
                          print(location),
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
