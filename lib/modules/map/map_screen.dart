import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller;

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
