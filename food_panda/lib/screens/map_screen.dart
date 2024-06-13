import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_panda/Apis/decode_location.dart';
import 'package:food_panda/Apis/firebase_services.dart';
import 'package:food_panda/home_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Location _locationController = new Location();

  // final Completer<GoogleMapController> _mapController =
  //     Completer<GoogleMapController>();

  // static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  // static const LatLng _pApplePlex = LatLng(37.3346, -122.0090);
  // LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.abc),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ));
        },
      ),
      body: FirebaseServices.currentP == null
          ? const Center(
              child: Text('Loading...'),
            )
          : GoogleMap(
              // focus current location
              onMapCreated: ((GoogleMapController controller) =>
                  FirebaseServices.mapController.complete(controller)),
              initialCameraPosition: CameraPosition(
                  target: FirebaseServices.pGooglePlex, zoom: 13),
              markers: {
                  Marker(
                      markerId: MarkerId("_currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: FirebaseServices.currentP!),
                  Marker(
                      markerId: MarkerId("_sourceLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: FirebaseServices.pGooglePlex),
                  Marker(
                      markerId: MarkerId("_destinationLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: FirebaseServices.pApplePlex),
                }),
    );
  }

  // pointing camera on current mark location
  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller =
        await FirebaseServices.mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled =
        await FirebaseServices.locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled =
          await FirebaseServices.locationController.requestService();
    } else {
      return;
    }

    _permissionGranted =
        await FirebaseServices.locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted =
          await FirebaseServices.locationController.requestPermission();
    }
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
    FirebaseServices.locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.altitude != null) {
        setState(() {
          FirebaseServices.currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(FirebaseServices.currentP!);

          log('$FirebaseServices.currentP!');
        });
      }
    });
  }
}
