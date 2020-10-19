import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  final lt, lg;
  MyMap(this.lt, this.lg);
  @override
  _MyMapState createState() => _MyMapState(lt, lg);
}

class _MyMapState extends State<MyMap> {
  MapType _defaultMapType = MapType.normal;
  // CameraPosition _initialPosition =
  //     CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  _MyMapState(lt, lg);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    // CameraPosition _initialPosition =
    //     CameraPosition(target: LatLng(26.8206, 30.8025));
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.lg),
            centerTitle: true,
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: _defaultMapType,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: LatLng(26.8206, 30.8025)),
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80, right: 10),
                alignment: Alignment.topRight,
                child: Column(children: <Widget>[
                  FloatingActionButton(
                      child: Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.teal[200],
                      onPressed: () {
                        _changeMapType();
                        print('Changing the Map Type');
                      }),
                ]),
              ),
            ],
          )),
    );
  }
}
