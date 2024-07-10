import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:equatable/equatable.dart';

class HistoryStates extends Equatable {


  @override
  List<Object?> get props => [];
}

class InitialLoading extends HistoryStates {

}

class DataFetched extends HistoryStates {
  final List<DrivingData> datas;

  DataFetched({required this.datas});

  @override
  List<Object?> get props => [datas];
}

class DataFetchingFailure extends HistoryStates {
  final ApiError error;

  DataFetchingFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

class EmptyData extends HistoryStates {
  final String message;

  EmptyData({required this.message});

  @override
  List<Object?> get props => [message];
}
