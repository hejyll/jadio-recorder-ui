import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'recorder_api_client.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:5000')
abstract class RecorderApiClient {
  factory RecorderApiClient(Dio dio, {String baseUrl}) = _RecorderApiClient;

  @GET('/programs')
  Future<dynamic> programs(
    @Query('page') int? page,
    @Query('items') int? items,
    @Query('status') String? status,
  );
}
