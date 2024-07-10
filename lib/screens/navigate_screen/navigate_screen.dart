import 'package:ateam_flutter_mt/data/globals/globals.dart';
import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:ateam_flutter_mt/routes.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/arguments/navigate_screen_arguments.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/bloc/navigate_screen_bloc.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/bloc/navigate_screen_events.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/bloc/navigate_screen_states.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/location_widget.dart';
import 'package:ateam_flutter_mt/widgets/custom_alert_dialog.dart';
import 'package:ateam_flutter_mt/widgets/custom_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class NavigateScreen extends StatefulWidget {
  final NavigateScreenArguments arguments;

  const NavigateScreen({super.key, required this.arguments});

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  final _navigateBloc = NavigationScreenBloc();
  late MapboxMapController _mapController;
  DrivingData ? currentData;

  @override
  void initState() {
    final arg = widget.arguments;
    _navigateBloc.add(GetDirections(startLat: arg.startLocation.properties.coordinates.latitude, startLong: arg.startLocation.properties.coordinates.longitude, endLat: arg.endLocation.properties.coordinates.latitude, endLong: arg.endLocation.properties.coordinates.latitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                        color: Colors.blueAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, bottom: 50.0, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocationWidget(location: widget.arguments.startLocation),
                            const Divider(color: Colors.white),
                            LocationWidget(location: widget.arguments.endLocation),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    BlocConsumer(
                        bloc: _navigateBloc,
                        listener: (context, state) {
                          if(state is DrivingDataSaved) {
                            Navigator.of(context).pop();
                            CustomPopup(
                                popup: CustomAlertDialog.success(
                                  title: "Data Stored Successfully",
                                  content: state.message,
                                  callback: () {
                                    Navigator.of(context).pushReplacementNamed(AppRoutes.home_screen);
                                  },
                                )
                            ).show(context);
                          }

                          if(state is StoreDataFailed) {
                            Navigator.of(context).pop();
                            CustomPopup(
                                popup: CustomAlertDialog.warning(
                                  title: "Error Occured",
                                  content: state.error.message,
                                  callback: () {
                                    Navigator.of(context).pop();
                                  },
                                )).show(context);
                          }

                          if(state is DirectionsFetched) {
                            setState(() {
                              currentData = state.drivingData;
                            });
                          }

                          if(state is InitialLoading) {
                            loadingDialog();
                          }
                        },
                        builder: (context, state) {

                          if(state is DirectionsFetched) {
                            Navigator.of(context).pop();

                            return Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0)),
                                child: MapboxMap(
                                  accessToken: Globals.ACCESS_TOKEN,
                                  onMapCreated: (MapboxMapController controller) {
                                    _mapController = controller;
                                    fetchAndDrawRoute(data: state.drivingData);
                                  },
                                  initialCameraPosition: const CameraPosition(
                                    target: LatLng(0.0, 0.0), // Set initial position
                                    zoom: 11.0,
                                  ),

                                ),
                              ),
                            );
                          }
                          return Container();
                        }
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.blueAccent,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                _navigateBloc.add(SaveData(data: currentData!));
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.blueAccent
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        )
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

    _mapController.addSymbol(SymbolOptions(
      geometry: LatLng(widget.arguments.startLocation.properties.coordinates.latitude,widget.arguments.startLocation.properties.coordinates.longitude),
      iconImage: "marker-15",
      iconSize: 5.0,
    ));
    _mapController.addSymbol(SymbolOptions(
      geometry: LatLng(widget.arguments.endLocation.properties.coordinates.latitude,widget.arguments.endLocation.properties.coordinates.longitude),
      iconImage: "marker-15",
      iconSize: 5.0,
    ));

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

  loadingDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        // dialogContext = context;
        return const Dialog(
          child: SizedBox(
            height: 100.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
