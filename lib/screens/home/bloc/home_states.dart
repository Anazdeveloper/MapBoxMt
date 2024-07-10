import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';
import 'package:ateam_flutter_mt/data/models/responses/suggestion_data.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:equatable/equatable.dart';

class HomeStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends HomeStates {

}

class SuggestionsLoaded extends HomeStates {
  final List<Suggestion> suggestions;

  SuggestionsLoaded({required this.suggestions});

  @override
  List<Object?> get props => [suggestions];
}

class SuggestionsLoadingFailed extends HomeStates {
  final ApiError error;

  SuggestionsLoadingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class LocationFetched extends HomeStates {
  final Feature locationFeature;

  LocationFetched({required this.locationFeature});

  @override
  List<Object?> get props => [locationFeature];
}

class LocationFetchFailed extends HomeStates {
  final ApiError error;

  LocationFetchFailed({required this.error});

  @override
  List<Object?> get props => [error];
}