// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:tt/components/custom_snackbar.dart';

// class LocationService {
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     var res = await Geolocator.getCurrentPosition();
//     return res;
//   }

//   Future<Position?> getPosition() async {
//     try {
//       return await _determinePosition();
//     } catch (e) {
//       Get.showSnackbar(buildCustomSnackbar(e.toString(), false));
//     }
//     return null;
//   }
// }
