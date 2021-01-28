import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationWidget extends StatefulWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  _CurrentLocationWidgetState createState() => _CurrentLocationWidgetState();
}

class _CurrentLocationWidgetState extends State<CurrentLocationWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
                height: _heigth * 0.5,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kCentroLatacunga,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ))
          ],
        ),
      ),
    );
  }
}