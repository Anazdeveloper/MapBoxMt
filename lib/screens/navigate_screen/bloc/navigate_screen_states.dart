import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:equatable/equatable.dart';

class NavigateScreenStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends NavigateScreenStates {}

class DirectionsFetched extends NavigateScreenStates {
  final DrivingData drivingData;

  DirectionsFetched({required this.drivingData});

  @override
  List<Object?> get props => [drivingData];
}

class DirectionsFetchingFailed extends NavigateScreenStates {
  final ApiError error;

  DirectionsFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class DrivingDataSaved extends NavigateScreenStates {
  final String message;

  DrivingDataSaved({required this.message});

  @override
  List<Object?> get props => [message];
}

class StoreDataFailed extends NavigateScreenStates {
  final ApiError error;

  StoreDataFailed({required this.error});

  @override
  List<Object?> get props => [error];
}