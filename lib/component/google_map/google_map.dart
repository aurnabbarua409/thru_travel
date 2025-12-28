import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../../services/location/location_service.dart';

class ShowGoogleMap extends StatelessWidget {
  const ShowGoogleMap({
    super.key,
    this.marker = const [],
    required this.onTapLatLong,
  });

  final List<Marker> marker;

  final Function(LatLng value) onTapLatLong;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowGoogleMapController>(
      builder: (controller) {
        return GoogleMap(
          mapType: MapType.normal,
          circles: {
            Circle(
              circleId: const CircleId('my_circle'),
              center: LatLng(37.42796133580664, -122.085749655962),
              radius: 25000,
              fillColor: Colors.blue.withOpacity(0.2),
              strokeColor: Colors.blue,
              strokeWidth: 2,
            ),
            ...controller.circles,
          },
          initialCameraPosition:
              controller.kGooglePlex ??
              const CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 10,
              ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          cameraTargetBounds: CameraTargetBounds.unbounded,
          onTap: (LatLng latLng) {
            onTapLatLong(latLng);
            // controller.setMarker(latLng);
          },
          markers: {...marker},
          onMapCreated: (GoogleMapController googleMapController) {
            if (!controller.controller.isCompleted) {
              controller.controller.complete(googleMapController);
            }
          },
        );
      },
    );
  }
}

class ShowGoogleMapController extends GetxController {
  static ShowGoogleMapController get instance =>
      Get.put(ShowGoogleMapController());

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  final Set<Circle> circles = <Circle>{};

  CameraPosition? kGooglePlex;

  Future<Marker> setMarker(LatLng latLng) async {
    Marker newMarker = Marker(
      markerId: const MarkerId("1"),
      position: LatLng(latLng.latitude, latLng.longitude),
    );

    update();

    return newMarker;
  }

  getCurrentLocation() async {
    Position? positions = await LocationService.getCurrentPosition();
    if (positions != null) {
      kGooglePlex = CameraPosition(
        target: LatLng(positions.latitude, positions.longitude),
        zoom: 10,
      );

      setMarker(LatLng(positions.latitude, positions.longitude));
      final GoogleMapController googleMapController = await controller.future;
      await googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(kGooglePlex!),
      );

      circles.add(
        Circle(
          circleId: const CircleId('my_circle'),
          center: LatLng(positions.latitude, positions.longitude),
          radius: 25000,
          fillColor: Colors.blue.withOpacity(0.2),
          strokeColor: Colors.blue,
          strokeWidth: 2,
        ),
      );
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }
}
