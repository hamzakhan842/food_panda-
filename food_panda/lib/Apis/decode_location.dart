// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Decoderz {
//   static String? address;

//   static Future<String?> getAddressFromLatLng(LatLng latLng) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         latLng.latitude,
//         latLng.longitude,
//       );

//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         address = "${place.street}, ${place.locality}, ${place.country}";
//         return address;
//       } else {
//         return "Address not found";
//       }
//     } catch (e) {
//       return "Error: $e";
//     }
//   }
// }
