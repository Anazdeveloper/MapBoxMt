import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';

class NavigateScreenArguments {
  final Feature startLocation;
  final Feature endLocation;

  NavigateScreenArguments({required this.startLocation, required this.endLocation});
}