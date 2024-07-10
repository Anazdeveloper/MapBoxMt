import 'package:ateam_flutter_mt/data/globals/globals.dart';
import 'package:ateam_flutter_mt/data/models/requests/driving_query_params.dart';
import 'package:ateam_flutter_mt/data/models/requests/retrieve_query_params.dart';
import 'package:ateam_flutter_mt/data/models/requests/suggestion_query_params.dart';
import 'package:ateam_flutter_mt/data/models/responses/driving_data.dart';
import 'package:ateam_flutter_mt/data/models/responses/retrieve_data.dart';
import 'package:ateam_flutter_mt/data/models/responses/suggestion_data.dart';
import 'package:ateam_flutter_mt/network/failures.dart';
import 'package:ateam_flutter_mt/network/http_client.dart';
import 'package:ateam_flutter_mt/network/urls.dart';

class MapRepository {
  static final MapRepository _instance = MapRepository._internal();
  final MapboxClient _mapboxClient = MapboxClient();
  final String _session_token = "0281f55c-e8d2-4dc1-8909-71b8c50091ab";
  final String _access_token = Globals.ACCESS_TOKEN;

  MapRepository._internal();

  factory MapRepository() {
    return _instance;
  }

  Future<SuggestionData> getSuggestions({required String query}) async {
    final params = SuggestionQueryParams(query: query, sessionToken: _session_token, accessToken: _access_token);

    final response = await _mapboxClient.get(urlPath: Urls.SEARCH_SUGGEST, queryParameters: params.toJson());

    if(response.statusCode == 200) {
      return SuggestionData.fromJson(response.data);
    }
    throw ApiError(
      message: response.data["error"]
    );
  }

  Future<RetrieveData> getLocationData({required String mapBoxId}) async {
    final params = RetrieveQueryParams(accessToken: _access_token, sessionToken: _session_token);

    final response = await _mapboxClient.get(urlPath: Urls.SEARCH_RETRIEVE+mapBoxId, queryParameters: params.toJson());

    if(response.statusCode == 200) {
      return RetrieveData.fromJson(response.data);
    }
    throw ApiError(
      message: response.data["error"]
    );
  }

  Future<DrivingData> getDrivingData({required double startLat, required double endLat, required double startLong, required double endLong}) async {
    final params = DrivingQueryParams(alternatives: "false", geometries: 'geojson', steps: "false", accessToken: _access_token);

    final response = await _mapboxClient.get(urlPath: '${Urls.DIRECTIONS}$startLong,$startLat;$endLong,$endLat', queryParameters: params.toJson());

    if(response.statusCode == 200) {
      return DrivingData.fromJson(response.data);
    }
    throw ApiError(
        message: response.data["error"]
    );
  }
}