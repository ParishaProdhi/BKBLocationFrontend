import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/nav-drawer.dart';

import 'Services.dart';
import 'locations.dart';

class JsonParse extends StatefulWidget {
  final id;
  //final int id;
  JsonParse(this.id);
  //  JsonParse() : super();
  // var id;
  // JsonParse({this.id});
  @override
  _JsonParseState createState() => _JsonParseState(id);
  // State<StatefulWidget> createState() {
  //   return _JsonParseState(id);
  // }
}

class _JsonParseState extends State<JsonParse> {
  //
  List<Location> _locations;
  bool _loading;

  _JsonParseState(final id);
  // var id;
  // _JsonParseState({this.id});

  @override
  void initState() {
    super.initState();
    _loading = true;
    // id = widget.id;
    // print(id);
    Services.getLocations(id).then((locations) {
      setState(() {
        _locations = locations;
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
                        onPressed: () {/* ... */},
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
