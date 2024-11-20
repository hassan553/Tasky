// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:map_picker/map_picker.dart';
// import 'package:tt/components/buttons/loaction_option_button.dart';
// import 'package:tt/components/custom_app_bar.dart';
// import 'package:tt/components/custom_button.dart';
// import 'package:tt/components/custom_snackbar.dart';
// import 'package:tt/components/text_field_component.dart';
// import 'package:tt/core/services/location_service/location_service.dart';
// import 'package:tt/core/utils/app_colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tt/core/constants/app_images_path.dart';
// import 'package:tt/core/localization/app_strings.dart';
// import 'package:tt/features/services_features/logic/controller/add_new_service_details_controller.dart';
// import 'package:tt/routes/app_routes.dart';

// class ShowGoogleMapServices extends StatefulWidget {
//   const ShowGoogleMapServices({super.key});

//   @override
//   State<ShowGoogleMapServices> createState() => _ShowGoogleMapServicesState();
// }

// class _ShowGoogleMapServicesState extends State<ShowGoogleMapServices> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   Set<Marker> markers = {};
//   CameraPosition? _kGooglePlex;
//   LatLng? latLng;
//   MapPickerController mapPickerController = MapPickerController();
//   @override
//   void initState() {
//     super.initState();
//     _initializeMap();
//   }

//   Future<void> _initializeMap() async {
//     try {
//       // Retrieve the user's current location
//       await LocationService().getPosition();
//       latLng = await _parseLatLng();

//       if (latLng != null) {
//         setState(() {
//           _kGooglePlex = CameraPosition(
//             target: latLng!,
//             zoom: 15,
//           );
//           _addMarker(latLng!);
//         });
//       }
//     } catch (e) {
//       // Handle location retrieval errors here
//       print("Error retrieving location: $e");
//     }
//   }

//   Future<LatLng> _parseLatLng() async {
//     Position? l;
//     // Example: manually parsing LatLng
//     try {
//       l = await Geolocator.getCurrentPosition();
//     } catch (e) {}
//     return LatLng(l?.latitude ?? 30.466940, l?.longitude ?? 30.934191);
//     // In a real-world scenario, you might fetch this from a text field or some state:
//     // List<String> pos = Get.find<DoctorChangeProfileInformationsController>()
//     //     .doctorLocationController
//     //     .text
//     //     .split(',');
//     // return LatLng(double.parse(pos[0]), double.parse(pos[1]));
//   }

//   void _addMarker(LatLng position) async {
//     markers.add(Marker(
//       markerId: const MarkerId('mylocation0'),
//       position: position,
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     ));
//     setState(() {});
//   }

//   void _setMarker(LatLng position) {
//     markers.clear();
//     _addMarker(position);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var servicecontroller = Get.find<ServiceDetailsController>();

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: CustomAppBar(title: AppStrings.confirmAndSend.tr),
//       ),
//       body: _kGooglePlex == null
//           ? const Center(
//               child:
//                   CircularProgressIndicator()) // Show a loading indicator while the map is initializing
//           : Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 MapPicker(
//                   mapPickerController: mapPickerController,
//                   showDot: true,
//                   iconWidget: Image.asset(
//                     "assets/images/marker.png",
//                     height: 60,
//                   ),
//                   child: GoogleMap(
//                     myLocationEnabled: true,
//                     zoomControlsEnabled: false,
//                     // hide location button
//                     myLocationButtonEnabled: false,
//                     mapType: MapType.normal,
//                     //  camera position
//                     initialCameraPosition: _kGooglePlex!,
//                     onMapCreated: (GoogleMapController controller) {
//                       _controller.complete(controller);
//                     },
//                     onCameraMoveStarted: () {
//                       // notify map is moving
//                       mapPickerController.mapMoving!();
//                       // textController.text = "checking ...";
//                     },
//                     onTap: (argument) async {
//                       final GoogleMapController camController =
//                           await _controller.future;
//                       camController.animateCamera(
//                           CameraUpdate.newCameraPosition(
//                               CameraPosition(target: argument, zoom: 15)));

//                       // =argument;
//                     },
//                     onCameraMove: (cameraPosition) {
//                       this._kGooglePlex = cameraPosition;
//                     },
//                     onCameraIdle: () async {
//                       // notify map stopped moving
//                       mapPickerController.mapFinishedMoving!();

//                       //get address name from camera position
//                       // List<Placemark> placemarks = await placemarkFromCoordinates(
//                       //   cameraPosition.target.latitude,
//                       //   cameraPosition.target.longitude,
//                       // );

//                       // update the ui with the address
//                       // textController.text =
//                       // '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
//                     },
//                   ),

//                   //  GoogleMap(
//                   //   markers: markers,
//                   //   // minMaxZoomPreference: const MinMaxZoomPreference(12, 30),
//                   //   mapType: MapType.normal,
//                   //   onTap: (LatLng position) async {
//                   //     // _setMarker(position);
//                   //     // Update controller or state with the new location, if necessary
//                   //     servicecontroller.selectedLocation?.lat =
//                   //         position.latitude.toString();
//                   //     servicecontroller.selectedLocation?.long =
//                   //         position.longitude.toString();
//                   //     await pickLoactionTitle(context, servicecontroller);
//                   //   },
//                   //   zoomControlsEnabled: false,
//                   //   initialCameraPosition: _kGooglePlex!,
//                   //   onMapCreated: (GoogleMapController controller) {
//                   //     _controller.complete(controller);
//                   //   },
//                   // ),
//                 ),
//                 Positioned(
//                   bottom: 20.h,
//                   width: 0.9.sw,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       LoactionButton(
//                           icon: AppImages.Location,
//                           title: AppStrings.currentLocation.tr,
//                           onTab: () async {
//                             try {
//                               var position =
//                                   await Geolocator.getCurrentPosition();
//                               var latLng =
//                                   LatLng(position.latitude, position.longitude);
//                               _setMarker(latLng);
//                               Future.delayed(Duration(seconds: 1), () async {});
//                               servicecontroller.selectedLocation?.lat =
//                                   latLng.latitude.toString();
//                               servicecontroller.selectedLocation!.long =
//                                   latLng.longitude.toString();

//                               final GoogleMapController camController =
//                                   await _controller.future;
//                               camController.animateCamera(
//                                   CameraUpdate.newCameraPosition(CameraPosition(
//                                       target: latLng, zoom: 15)));
//                               await pickLoactionTitle(
//                                   context, servicecontroller);
//                             } on Exception catch (_) {
//                               buildCustomSnackbar(
//                                   AppStrings.pleaseEnableLocationService.tr,
//                                   false);
//                             }
//                           }),
//                       LoactionButton(
//                         icon: AppImages.perviousLocation,
//                         onTab: () async {
//                           var servController =
//                               Get.find<ServiceDetailsController>();
//                           var res = await Get.toNamed(Routes.chooseLocationPage,
//                               arguments: servicecontroller.selectedLocation);
//                           if (res != null) {
//                             servicecontroller.selectedLocation = res;
//                             final GoogleMapController camController =
//                                 await _controller.future;
//                             camController.animateCamera(
//                                 CameraUpdate.newCameraPosition(CameraPosition(
//                                     target: LatLng(
//                                         double.parse(servController
//                                             .selectedLocation!.lat!),
//                                         double.parse(servController
//                                             .selectedLocation!.long!)),
//                                     zoom: 18)));
//                           }
//                         },
//                         title: AppStrings.previousLocation.tr,
//                       ),
//                       CustomButton(
//                           text: AppStrings.next.tr,
//                           onTap: () async {
//                             if (servicecontroller
//                                     .selectedLocation!.lat!.isNotEmpty &&
//                                 servicecontroller
//                                     .selectedLocation!.title!.isNotEmpty) {
//                               Get.back(result: true);
//                             } else if (servicecontroller
//                                     .selectedLocation!.lat!.isNotEmpty &&
//                                 servicecontroller
//                                     .selectedLocation!.title!.isEmpty) {
//                               await pickLoactionTitle(
//                                   context, servicecontroller);
//                             } else {
//                               var servController =
//                                   Get.find<ServiceDetailsController>();
//                               servController.selectedLocation!.lat =
//                                   _kGooglePlex!.target.latitude.toString();
//                               servController.selectedLocation!.long =
//                                   _kGooglePlex!.target.longitude.toString();
//                               await pickLoactionTitle(
//                                   context, servicecontroller);
//                             }
//                           },
//                           color: AppColors.whiteColor),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//     );
//   }

//   Future<dynamic> pickLoactionTitle(
//       BuildContext context, ServiceDetailsController controller) {
//     return showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text(AppStrings.addANameForThePickedLocation.tr),
//               content: TextFieldComponent(
//                 hint: "",
//                 onChange: (value) {
//                   controller.selectedLocation!.title = value;
//                 },
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       controller.selectedLocation!.title = "";
//                       Get.back();
//                     },
//                     child: Text(AppStrings.cancel.tr)),
//                 TextButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     child: Text(AppStrings.add.tr)),
//               ],
//             ));
//   }
// }
