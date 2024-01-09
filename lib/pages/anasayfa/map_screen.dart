import 'dart:async';
import 'package:flutter/material.dart';
import 'package:araba_sevdasi/pages/anasayfa/calculate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}
class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _markers = {};
  List<LatLng> markerLocations = [];
  Map<PolylineId, Polyline> polylines = {};
  
  static const CameraPosition _edirneMerkez = CameraPosition(
    target: LatLng(41.6771, 26.5557),
    zoom: 14.4746,
  );

  String infoText = 'Choose Start point';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _edirneMerkez,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: _addMarker,
            markers: _markers,
            polylines: Set<Polyline>.of(polylines.values),
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: ElevatedButton(
              onPressed: () {
                if (markerLocations.length == 2) {
                  // _calculateDistance(markerLocations[0], markerLocations[1]);
                  pushCalculatePage(context);
                }
              },
              child: Text(infoText, style: const TextStyle(fontSize: 20.0)),
            ),
          ),
        ],
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_markers.length >= 2) {
      return;
    }

    setState(() {
      if (_markers.isEmpty) {
        _markers.add(Marker(
        markerId: const MarkerId('origin'),
        position: pos,
      ));
      markerLocations.add(pos);
      }
      else if(_markers.length == 1){
         _markers.add(Marker(
        markerId: const MarkerId('dest'),
        position: pos,
      ));
      markerLocations.add(pos);
      }

      if (markerLocations.length == 1) {
        infoText = 'Choose the end point';
      } else if (markerLocations.length == 2) {
        infoText = 'Calculate the distance';
      }
    });
  }

  // Distance Calculate Method
  Future<void> _calculateDistance(LatLng pos1, LatLng pos2) async {
    double distanceInMeters = Geolocator.distanceBetween(
      pos1.latitude,
      pos1.longitude,
      pos2.latitude,
      pos2.longitude,
    );
    setState(() {
      infoText = 'Konumlar arasındaki mesafe: ${distanceInMeters.toStringAsFixed(2)} metre';
    });
  }

  void pushCalculatePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculate()));
  }

}
