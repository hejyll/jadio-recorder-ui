import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:jadio_recorder_ui/apis/recorder_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';

void main() {
  final server = MockWebServer(port: 5001);
  late RecorderApiClient apiClient;

  setUp(() {
    server.start();
    apiClient = RecorderApiClient(Dio(), baseUrl: 'http://127.0.0.1:5001');
  });

  tearDown(server.shutdown);

  group('API client communication testing', () {
    test('Http status code 200 with programs method testing', () async {
      final body = File('test/fixtures/programs.json').readAsStringSync();
      server.enqueue(
        httpCode: 200,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      final responseBody = await apiClient.programs(0, 10, 'fetched');
      expect(responseBody, json.decode(body));
      final request = server.takeRequest();
      expect(request.uri.path, '/programs');
    });
  });
}
