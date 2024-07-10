import 'package:ateam_flutter_mt/data/globals/globals.dart';
import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HistoryWidget extends StatefulWidget {
  final DrivingData data;
  final int index;

  const HistoryWidget({super.key, required this.data, required this.index});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {

  late MapboxMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on_rounded),
                Text("Trip ${widget.index + 1}")
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0)),
                child: MapboxMap(
                  accessToken: Globals.ACCESS_TOKEN,
                  onMapCreated: (MapboxMapController controller) {
                    _mapController = controller;
                    fetchAndDrawRoute(data: widget.data);
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0.0, 0.0), // Set initial position
                    zoom: 11.0,
                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchAndDrawRoute({required DrivingData data}) async {
    final geometry = data.routes.first.geometry;
    final coordinates = geometry.coordinates;
    final List<LatLng> latLngList = coordinates
        .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
        .toList();

    _mapController.addLine(LineOptions(
      geometry: latLngList,
      lineColor: "#0000FF",
      lineWidth: 5.0,
    ), {});

    // _mapController.addSymbol(SymbolOptions(
    //   geometry: LatLng(widget.arguments.startLocation.properties.coordinates.latitude,widget.arguments.startLocation.properties.coordinates.longitude),
    //   iconImage: "marker-15",
    //   iconSize: 5.0,
    // ));
    // _mapController.addSymbol(SymbolOptions(
    //   geometry: LatLng(widget.arguments.endLocation.properties.coordinates.latitude,widget.arguments.endLocation.properties.coordinates.longitude),
    //   iconImage: "marker-15",
    //   iconSize: 5.0,
    // ));

    LatLngBounds bounds = _calculateBounds(latLngList);
    _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds));
    _mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(latLngList[0].latitude, latLngList[1].longitude), 8.0));
  }

  LatLngBounds _calculateBounds(List<LatLng> coordinates) {
    double? minLat, maxLat, minLng, maxLng;

    for (var coord in coordinates) {
      if (minLat == null || coord.latitude < minLat) minLat = coord.latitude;
      if (maxLat == null || coord.latitude > maxLat) maxLat = coord.latitude;
      if (minLng == null || coord.longitude < minLng) minLng = coord.longitude;
      if (maxLng == null || coord.longitude > maxLng) maxLng = coord.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat!, minLng!),
      northeast: LatLng(maxLat!, maxLng!),
    );
  }
}
