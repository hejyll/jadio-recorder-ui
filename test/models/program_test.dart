import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:jadio_recorder_ui/models/program.dart';

void main() {
  test('Test Program constructor', () {
    final program = Program(
      id: 1000,
      stationId: 'DUMMY',
      name: 'This is program name',
      url: 'https://test.html',
      description: 'This is description',
      information: 'This is information',
      performers: [
        'Hoge',
        'Fuga',
      ],
      copyright: 'copyright@test',
      episodeId: 31415,
      episodeName: '#100',
      datetime: DateTime(2022, 12, 17, 10, 00),
      duration: 3600,
      asciiName: 'hoge',
      guests: [
        'Hage',
      ],
      imageUrl: 'https://test.jpg',
      isVideo: false,
      status: 'fetched',
    );

    expect(program.id, 1000);
    expect(program.stationId, 'DUMMY');
    expect(program.name, 'This is program name');
    expect(program.url, 'https://test.html');
    expect(program.description, 'This is description');
    expect(program.information, 'This is information');
    expect(program.performers, ['Hoge', 'Fuga']);
    expect(program.copyright, 'copyright@test');
    expect(program.episodeId, 31415);
    expect(program.episodeName, '#100');
    expect(program.datetime, DateTime(2022, 12, 17, 10, 00));
    expect(program.duration, 3600);
    expect(program.asciiName, 'hoge');
    expect(program.guests, ['Hage']);
    expect(program.imageUrl, 'https://test.jpg');
    expect(program.isVideo, false);
    expect(program.status, 'fetched');
  });

  test('Test Program.fromJson', () {
    final jsonData =
        json.decode(File('test/fixtures/programs.json').readAsStringSync())[0];
    final program = Program.fromJson(jsonData);
    jsonData["datetime"] = DateTime.parse(jsonData["datetime"]);

    expect(program.id, jsonData['id']);
    expect(program.stationId, jsonData['stationId']);
    expect(program.name, jsonData['name']);
    expect(program.url, jsonData['url']);
    expect(program.description, jsonData['description']);
    expect(program.information, jsonData['information']);
    expect(program.performers, jsonData['performers']);
    expect(program.copyright, jsonData['copyright']);
    expect(program.episodeId, jsonData['episodeId']);
    expect(program.episodeName, jsonData['episodeName']);
    expect(program.datetime, jsonData['datetime']);
    expect(program.duration, jsonData['duration']);
    expect(program.asciiName, jsonData['asciiName']);
    expect(program.guests, jsonData['guests']);
    expect(program.imageUrl, jsonData['imageUrl']);
    expect(program.isVideo, jsonData['isVideo']);
    expect(program.status, jsonData['status']);
  });
}
