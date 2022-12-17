import 'package:dio/dio.dart';
import 'package:jadio_recorder_ui/apis/recorder_api_client.dart';
import 'package:jadio_recorder_ui/models/program.dart';

class RecorderRepository {
  RecorderRepository({required this.apiClient});

  final RecorderApiClient apiClient;

  Future<List<Program>> programs(int? page, int? items, String? status) async {
    return apiClient.programs(page, items, status).then((value) {
      return value
          .map((e) => Program.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<Program>();
    });
  }
}
