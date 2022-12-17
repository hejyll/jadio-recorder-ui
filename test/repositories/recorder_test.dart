import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jadio_recorder_ui/apis/recorder_api_client.dart';
import 'package:jadio_recorder_ui/models/program.dart';
import 'package:jadio_recorder_ui/repositories/recorder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'recorder_test.mocks.dart';

@GenerateMocks([RecorderApiClient])
void main() {
  late MockRecorderApiClient apiClient;
  late RecorderRepository repository;

  setUp(() {
    apiClient = MockRecorderApiClient();
    repository = RecorderRepository(apiClient: apiClient);
  });

  group('RecorderReository testing', () {
    test('Test fetch programs with empty response', () async {
      when(apiClient.programs(any, any, any)).thenAnswer((_) async => []);
      final programs = await repository.programs(0, 10, 'fetched');
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 0));
    });

    test('Test fetch programs', () async {
      final mockResponse =
          json.decode(File('test/fixtures/programs.json').readAsStringSync());
      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => mockResponse);
      final programs = await repository.programs(0, 10, 'fetched');
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 1)
              .having((list) => list[0].id, 'id',
                  mockResponse[0]['id'])
              .having((list) => list[0].stationId, 'stationId',
                  mockResponse[0]['stationId'])
              .having((list) => list[0].name, 'name',
                  mockResponse[0]['name'])
              .having((list) => list[0].url, 'url',
                  mockResponse[0]['url'])
              .having((list) => list[0].description, 'description',
                  mockResponse[0]['description'])
              .having((list) => list[0].information, 'information',
                  mockResponse[0]['information'])
              .having((list) => list[0].performers, 'performers',
                  mockResponse[0]['performers'])
              .having((list) => list[0].copyright, 'copyright',
                  mockResponse[0]['copyright'])
              .having((list) => list[0].episodeId, 'episodeId',
                  mockResponse[0]['episodeId'])
              .having((list) => list[0].episodeName, 'episodeName',
                  mockResponse[0]['episodeName'])
              .having((list) => list[0].datetime, 'datetime',
                  DateTime.parse(mockResponse[0]['datetime']))
              .having((list) => list[0].duration, 'duration',
                  mockResponse[0]['duration'])
              .having((list) => list[0].asciiName, 'asciiName',
                  mockResponse[0]['asciiName'])
              .having((list) => list[0].guests, 'guests',
                  mockResponse[0]['guests'])
              .having((list) => list[0].imageUrl, 'imageUrl',
                  mockResponse[0]['imageUrl'])
              .having((list) => list[0].isVideo, 'isVideo',
                  mockResponse[0]['isVideo'])
              .having((list) => list[0].status, 'status',
                  mockResponse[0]['status']));
    });
  });
}
