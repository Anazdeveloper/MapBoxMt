import 'package:ateam_flutter_mt/data/local_storage/hive_helper.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:ateam_flutter_mt/screens/history/bloc/history_events.dart';
import 'package:ateam_flutter_mt/screens/history/bloc/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryStates> {
  HistoryBloc(): super(InitialLoading()) {
    on<GetData>((event,emit) async {
      try {
        emit(InitialLoading());
        final datas = await HiveHelper().fetchDrivingDatas();
        if(datas.isEmpty) {
          emit(EmptyData(message: "Empty Data"));
        } else {
          emit(DataFetched(datas: datas));
        }
      } catch(e) {
        if(e is ApiError) {
          emit(DataFetchingFailure(error: e));
        } else {
          print("Error: $e");
        }
      }
    });
  }
}