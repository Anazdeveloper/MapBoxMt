import 'package:dio/dio.dart';

class MapboxClient {
  static final MapboxClient _mInstance = MapboxClient._();
  final Dio _dio = Dio();

  factory MapboxClient() {
    return _mInstance;
  }

  MapboxClient._() {
    BaseOptions options = BaseOptions();
  }

  Future<Response> get({urlPath, queryParameters, header}) async {
      Response response =  await _dio.get(urlPath, queryParameters: queryParameters, options: Options(receiveDataWhenStatusError: true, headers: header));
      print("Response: $response");
      return response;
  }
}