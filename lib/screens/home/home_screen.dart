import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';
import 'package:ateam_flutter_mt/routes.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/arguments/navigate_screen_arguments.dart';
import 'package:ateam_flutter_mt/widgets/map_location_searchfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Feature startLocation;
  late Feature endLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
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
                      child: const ListTile(
                        leading: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        title: Text('John Doe', style: TextStyle(color: Colors.white),),
                        subtitle: Text('robertdoe@gmail.com', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: MapLocationSearchField(
                        hintText: 'Start Location',
                        onLatLngFetched: (location) {
                          setState(() {
                            startLocation = location;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: MapLocationSearchField(
                        hintText: 'End Location',
                        onLatLngFetched: (location) {
                          setState(() {
                            endLocation = location;
                          });
                        },
                      ),
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
                                  Navigator.of(context).pushNamed(AppRoutes.navigate_screen, arguments: NavigateScreenArguments(startLocation: startLocation, endLocation: endLocation));
                                },
                                child: const Text(
                                  'Navigate',
                                  style: TextStyle(
                                    color: Colors.blueAccent
                                  ),
                                ),
                            ),
                            const SizedBox(width: 20.0,),
                            MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.history_screen);
                              },
                              child: const Text(
                                'Saved',
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
}
