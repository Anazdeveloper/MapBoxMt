import 'package:equatable/equatable.dart';

class HomeEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSearchSuggestion extends HomeEvents {
  final String query;

  GetSearchSuggestion({required this.query});
}

class GetLocation extends HomeEvents {
  final String mapBoxId;

  GetLocation({required this.mapBoxId});
}