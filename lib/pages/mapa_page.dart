import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/providers/db_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;

    final CameraPosition puntoInicial = CameraPosition(
      target: scanModel.getLatLng(),
      zoom: 17.5,
      tilt: 50,
    );

    // Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scanModel.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_disabled),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(
                  target: scanModel.getLatLng(),
                  zoom: 17.5,
                  tilt: 50,
                )),
              );
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            elevation: 0,
            child: Icon(Icons.layers),
            onPressed: () {
              setState(() {
                if (mapType == MapType.normal) {
                  mapType = MapType.satellite;
                } else {
                  mapType = MapType.normal;
                }
              });
            },
          ),
          SizedBox(
            width: 50.0,
          ),
        ],
      ),
    );
  }
}
