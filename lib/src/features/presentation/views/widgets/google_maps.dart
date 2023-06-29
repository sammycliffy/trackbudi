import 'dart:async';
import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);
const CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

final Completer<GoogleMapController> controller0 = Completer();
googleMaps() {
  log("fine girl");
  return GoogleMap(
    mapType: MapType.hybrid,
    initialCameraPosition: kGooglePlex,
    onMapCreated: (GoogleMapController controller) {
      controller0.complete(controller);
    },
  );
}

Future<void> _goToTheLake() async {
  final GoogleMapController controller = await controller0.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
}
