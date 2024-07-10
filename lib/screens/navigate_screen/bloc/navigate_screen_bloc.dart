import 'package:ateam_flutter_mt/data/local_storage/hive_helper.dart';
import 'package:ateam_flutter_mt/data/repositories/map_respository.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/bloc/navigate_screen_events.dart';
import 'package:ateam_flutter_mt/screens/navigate_screen/bloc/navigate_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreenBloc extends Bloc<NavigateScreenEvents, NavigateScreenStates> {
  NavigationScreenBloc() : super(InitialLoading()) {
    on<GetDirections>((event, emit) async {
      try {
        emit(InitialLoading());
        final directionsData = await MapRepository().getDrivingData(startLat: event.startLat, endLat: event.endLat, startLong: event.startLong, endLong: event.endLong);
        emit(DirectionsFetched(drivingData: directionsData));
      } catch(e) {
        if(e is ApiError) {
          emit(DirectionsFetchingFailed(error: e));
        }
      }
    });

    on<SaveData>((event, emit) async {
      try {
        emit(InitialLoading());
        await HiveHelper().addDrivingDatas(event.data);
        emit(DrivingDataSaved(message: "Data saved successfully"));
      } catch(e) {
        if(e is ApiError) {
          emit(StoreDataFailed(error: e));
        } else {
          print("Error: $e");
        }
      }
    });
  }
}