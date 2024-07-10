import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:equatable/equatable.dart';

class NavigateScreenEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDirections extends NavigateScreenEvents {
  final double startLat;
  final double startLong;
  final double endLat;
  final double endLong;

  GetDirections({required this.startLat, required this.startLong, required this.endLat, required this.endLong});
}

class SaveData extends NavigateScreenEvents {
  final DrivingData data;

  SaveData({required this.data});
}