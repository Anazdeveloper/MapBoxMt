import 'package:ateam_flutter_mt/data/repositories/map_respository.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_events.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc(): super(InitialLoading()) {
    on<GetSearchSuggestion>((event, emit) async {
      try {
        emit(InitialLoading());
        final suggestionData = await MapRepository().getSuggestions(query: event.query);
        emit(SuggestionsLoaded(suggestions: suggestionData.suggestions));
      } catch(e) {
        if(e is ApiError) {
          emit(SuggestionsLoadingFailed(error: e));
        }
      }
    });

    on<GetLocation>((event, emit) async {
      try {
        emit(InitialLoading());
        final retreivedData = await MapRepository().getLocationData(mapBoxId: event.mapBoxId);
        emit(LocationFetched(locationFeature: retreivedData.features.first));
      } catch(e) {
        if(e is ApiError) {
          emit(LocationFetchFailed(error: e));
        }
      }
    });
  }
}