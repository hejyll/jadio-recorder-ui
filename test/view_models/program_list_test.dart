import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jadio_recorder_ui/apis/recorder_api_client.dart';
import 'package:jadio_recorder_ui/models/program.dart';
import 'package:jadio_recorder_ui/repositories/recorder.dart';
import 'package:jadio_recorder_ui/view_models/program_list.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'program_list_test.mocks.dart';

@GenerateMocks([RecorderApiClient])
void main() {
  late MockRecorderApiClient apiClient;
  late RecorderRepository repository;
  // late ProgramListViewModel view_model;
  int items = 1;

  setUp(() {
    apiClient = MockRecorderApiClient();
    repository = RecorderRepository(apiClient: apiClient);
    // view_model = ProgramListViewModel(repository);
  });

  group('RecorderReository testing', () {
    test('Test fetch programs with empty response', () async {
      when(apiClient.programs(any, any, any)).thenAnswer((_) async => []);

      final notifier = ProgramListViewModel(repository, items);
      expect(notifier.debugState.isLoading, isTrue);

      final _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      final programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 0));
    });

    test('Test fetch programs', () async {
      final mockResponses =
          json.decode(File('test/fixtures/programs.json').readAsStringSync());

      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => [mockResponses[0]]);

      final notifier = ProgramListViewModel(repository, items);
      expect(notifier.debugState.isLoading, isTrue);

      final _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      final programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 1)
              .having((list) => list[0].id, 'id', mockResponses[0]['id'])
              .having((list) => list[0].stationId, 'stationId',
                  mockResponses[0]['stationId'])
              .having((list) => list[0].name, 'name', mockResponses[0]['name'])
              .having((list) => list[0].url, 'url', mockResponses[0]['url'])
              .having((list) => list[0].description, 'description',
                  mockResponses[0]['description'])
              .having((list) => list[0].information, 'information',
                  mockResponses[0]['information'])
              .having((list) => list[0].performers, 'performers',
                  mockResponses[0]['performers'])
              .having((list) => list[0].copyright, 'copyright',
                  mockResponses[0]['copyright'])
              .having((list) => list[0].episodeId, 'episodeId',
                  mockResponses[0]['episodeId'])
              .having((list) => list[0].episodeName, 'episodeName',
                  mockResponses[0]['episodeName'])
              .having((list) => list[0].datetime, 'datetime',
                  DateTime.parse(mockResponses[0]['datetime']))
              .having((list) => list[0].duration, 'duration',
                  mockResponses[0]['duration'])
              .having((list) => list[0].asciiName, 'asciiName',
                  mockResponses[0]['asciiName'])
              .having(
                  (list) => list[0].guests, 'guests', mockResponses[0]['guests'])
              .having((list) => list[0].imageUrl, 'imageUrl',
                  mockResponses[0]['imageUrl'])
              .having((list) => list[0].isVideo, 'isVideo',
                  mockResponses[0]['isVideo'])
              .having((list) => list[0].status, 'status',
                  mockResponses[0]['status']));
    });

    test('Test fetch programs with loadMore', () async {
      final mockResponses =
          json.decode(File('test/fixtures/programs.json').readAsStringSync());

      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => [mockResponses[0]]);

      final notifier = ProgramListViewModel(repository, items);
      expect(notifier.debugState.isLoading, isTrue);

      var _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      var programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 1)
              .having((list) => list[0].id, 'id', mockResponses[0]['id'])
              .having((list) => list[0].stationId, 'stationId',
                  mockResponses[0]['stationId'])
              .having((list) => list[0].name, 'name', mockResponses[0]['name'])
              .having((list) => list[0].url, 'url', mockResponses[0]['url'])
              .having((list) => list[0].description, 'description',
                  mockResponses[0]['description'])
              .having((list) => list[0].information, 'information',
                  mockResponses[0]['information'])
              .having((list) => list[0].performers, 'performers',
                  mockResponses[0]['performers'])
              .having((list) => list[0].copyright, 'copyright',
                  mockResponses[0]['copyright'])
              .having((list) => list[0].episodeId, 'episodeId',
                  mockResponses[0]['episodeId'])
              .having((list) => list[0].episodeName, 'episodeName',
                  mockResponses[0]['episodeName'])
              .having((list) => list[0].datetime, 'datetime',
                  DateTime.parse(mockResponses[0]['datetime']))
              .having((list) => list[0].duration, 'duration',
                  mockResponses[0]['duration'])
              .having((list) => list[0].asciiName, 'asciiName',
                  mockResponses[0]['asciiName'])
              .having(
                  (list) => list[0].guests, 'guests', mockResponses[0]['guests'])
              .having((list) => list[0].imageUrl, 'imageUrl',
                  mockResponses[0]['imageUrl'])
              .having((list) => list[0].isVideo, 'isVideo',
                  mockResponses[0]['isVideo'])
              .having((list) => list[0].status, 'status',
                  mockResponses[0]['status']));

      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => [mockResponses[1]]);

      notifier.loadMore();
      expect(notifier.debugState.isLoading, isTrue);

      _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 2)
              .having((list) => list[1].id, 'id', mockResponses[1]['id'])
              .having((list) => list[1].stationId, 'stationId',
                  mockResponses[1]['stationId'])
              .having((list) => list[1].name, 'name', mockResponses[1]['name'])
              .having((list) => list[1].url, 'url', mockResponses[1]['url'])
              .having((list) => list[1].description, 'description',
                  mockResponses[1]['description'])
              .having((list) => list[1].information, 'information',
                  mockResponses[1]['information'])
              .having((list) => list[1].performers, 'performers',
                  mockResponses[1]['performers'])
              .having((list) => list[1].copyright, 'copyright',
                  mockResponses[1]['copyright'])
              .having((list) => list[1].episodeId, 'episodeId',
                  mockResponses[1]['episodeId'])
              .having((list) => list[1].episodeName, 'episodeName',
                  mockResponses[1]['episodeName'])
              .having((list) => list[1].datetime, 'datetime',
                  DateTime.parse(mockResponses[1]['datetime']))
              .having((list) => list[1].duration, 'duration',
                  mockResponses[1]['duration'])
              .having((list) => list[1].asciiName, 'asciiName',
                  mockResponses[1]['asciiName'])
              .having(
                  (list) => list[1].guests, 'guests', mockResponses[1]['guests'])
              .having((list) => list[1].imageUrl, 'imageUrl',
                  mockResponses[1]['imageUrl'])
              .having((list) => list[1].isVideo, 'isVideo',
                  mockResponses[1]['isVideo'])
              .having((list) => list[1].status, 'status',
                  mockResponses[1]['status']));
    });

    test('Test fetch programs with refresh', () async {
      final mockResponses =
          json.decode(File('test/fixtures/programs.json').readAsStringSync());

      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => [mockResponses[0]]);

      final notifier = ProgramListViewModel(repository, items);
      expect(notifier.debugState.isLoading, isTrue);

      var _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      var programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 1)
              .having((list) => list[0].id, 'id', mockResponses[0]['id'])
              .having((list) => list[0].stationId, 'stationId',
                  mockResponses[0]['stationId'])
              .having((list) => list[0].name, 'name', mockResponses[0]['name'])
              .having((list) => list[0].url, 'url', mockResponses[0]['url'])
              .having((list) => list[0].description, 'description',
                  mockResponses[0]['description'])
              .having((list) => list[0].information, 'information',
                  mockResponses[0]['information'])
              .having((list) => list[0].performers, 'performers',
                  mockResponses[0]['performers'])
              .having((list) => list[0].copyright, 'copyright',
                  mockResponses[0]['copyright'])
              .having((list) => list[0].episodeId, 'episodeId',
                  mockResponses[0]['episodeId'])
              .having((list) => list[0].episodeName, 'episodeName',
                  mockResponses[0]['episodeName'])
              .having((list) => list[0].datetime, 'datetime',
                  DateTime.parse(mockResponses[0]['datetime']))
              .having((list) => list[0].duration, 'duration',
                  mockResponses[0]['duration'])
              .having((list) => list[0].asciiName, 'asciiName',
                  mockResponses[0]['asciiName'])
              .having(
                  (list) => list[0].guests, 'guests', mockResponses[0]['guests'])
              .having((list) => list[0].imageUrl, 'imageUrl',
                  mockResponses[0]['imageUrl'])
              .having((list) => list[0].isVideo, 'isVideo',
                  mockResponses[0]['isVideo'])
              .having((list) => list[0].status, 'status',
                  mockResponses[0]['status']));

      when(apiClient.programs(any, any, any))
          .thenAnswer((_) async => [mockResponses[1]]);

      notifier.refresh();
      expect(notifier.debugState.isLoading, isTrue);

      _ = await notifier.debugState; // workaround for sync
      expect(notifier.debugState.hasValue, isTrue);

      programs = notifier.debugState.value;
      verify(apiClient.programs(any, any, any)).called(1);
      expect(
          programs,
          isA<List<Program>>()
              .having((list) => list, 'isNotNull', isNotNull)
              .having((list) => list.length, 'length', 1)
              .having((list) => list[0].id, 'id', mockResponses[1]['id'])
              .having((list) => list[0].stationId, 'stationId',
                  mockResponses[1]['stationId'])
              .having((list) => list[0].name, 'name', mockResponses[1]['name'])
              .having((list) => list[0].url, 'url', mockResponses[1]['url'])
              .having((list) => list[0].description, 'description',
                  mockResponses[1]['description'])
              .having((list) => list[0].information, 'information',
                  mockResponses[1]['information'])
              .having((list) => list[0].performers, 'performers',
                  mockResponses[1]['performers'])
              .having((list) => list[0].copyright, 'copyright',
                  mockResponses[1]['copyright'])
              .having((list) => list[0].episodeId, 'episodeId',
                  mockResponses[1]['episodeId'])
              .having((list) => list[0].episodeName, 'episodeName',
                  mockResponses[1]['episodeName'])
              .having((list) => list[0].datetime, 'datetime',
                  DateTime.parse(mockResponses[1]['datetime']))
              .having((list) => list[0].duration, 'duration',
                  mockResponses[1]['duration'])
              .having((list) => list[0].asciiName, 'asciiName',
                  mockResponses[1]['asciiName'])
              .having(
                  (list) => list[0].guests, 'guests', mockResponses[1]['guests'])
              .having((list) => list[0].imageUrl, 'imageUrl',
                  mockResponses[1]['imageUrl'])
              .having((list) => list[0].isVideo, 'isVideo',
                  mockResponses[1]['isVideo'])
              .having((list) => list[0].status, 'status',
                  mockResponses[1]['status']));
    });
  });
}
