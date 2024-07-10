import 'package:ateam_flutter_mt/data/globals/globals.dart';
import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';
import 'package:ateam_flutter_mt/data/models/responses/suggestion_data.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_bloc.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_events.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_states.dart';
import 'package:ateam_flutter_mt/screens/home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapLocationSearchField extends StatefulWidget {
  final String hintText;
  final void Function(Feature) onLatLngFetched;
  const MapLocationSearchField({super.key, required this.hintText, required this.onLatLngFetched});

  @override
  State<MapLocationSearchField> createState() => _MapLocationSearchFieldState();
}

class _MapLocationSearchFieldState extends State<MapLocationSearchField> {
  final TextEditingController _searchController = TextEditingController();
  late MapboxMapController _mapController;

  final _homeBloc = HomeBloc();
  double lat = 8.88587;
  double long = 76.590974;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _homeBloc,
      listener: (context, state) {
        if(state is LocationFetched) {
          setState(() {
            lat = state.locationFeature.properties.coordinates.latitude;
            long = state.locationFeature.properties.coordinates.longitude;
          });
          _mapController.animateCamera(CameraUpdate.newLatLng(LatLng(
            lat,
            long,
          )));
          _mapController.addSymbol(SymbolOptions(
            geometry: LatLng(
              lat,
              long,
            ),
            iconImage: 'car-15',
          ));
          widget.onLatLngFetched.call(state.locationFeature);
        }
      },
      child: Container(
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
              child: TextField(
                controller: _searchController,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SearchScreen(
                          onSelected: (Suggestion location) {
                            _searchController.text = location.name;
                            _homeBloc.add(GetLocation(mapBoxId: location.mapboxId));
                          },
                        );
                      }
                  );
                },
                // onTap: widget.onTap,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  hintText: widget.hintText,
                ),
                readOnly: true,
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
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, long), // Set initial position
                      zoom: 11.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
