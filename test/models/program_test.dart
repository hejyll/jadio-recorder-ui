import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:jadio_recorder_ui/models/program.dart';

void main() {
  test('Test Program constructor', () {
    final jsonData =
        json.decode(File('test/fixtures/programs.json').readAsStringSync())[0];
    final program = Program(
      id: jsonData['id'],
      stationId: jsonData['stationId'],
      name: jsonData['name'],
      url: jsonData['url'],
      description: jsonData['description'],
      information: jsonData['information'],
      performers: jsonData['performers'].cast<String>(),
      copyright: jsonData['copyright'],
      episodeId: jsonData['episodeId'],
      episodeName: jsonData['episodeName'],
      datetime: DateTime.parse(jsonData["datetime"]),
      duration: jsonData['duration'],
      asciiName: jsonData['asciiName'],
      guests: jsonData['guests'].cast<String>(),
      imageUrl: jsonData['imageUrl'],
      isVideo: jsonData['isVideo'],
      status: jsonData['status'],
    );

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
    expect(program.datetime, DateTime.parse(jsonData["datetime"]));
    expect(program.duration, jsonData['duration']);
    expect(program.asciiName, jsonData['asciiName']);
    expect(program.guests, jsonData['guests']);
    expect(program.imageUrl, jsonData['imageUrl']);
    expect(program.isVideo, jsonData['isVideo']);
    expect(program.status, jsonData['status']);
  });

  test('Test Program.fromJson', () {
    final jsonData =
        json.decode(File('test/fixtures/programs.json').readAsStringSync())[0];
    final program = Program.fromJson(jsonData);

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
    expect(program.datetime, DateTime.parse(jsonData["datetime"]));
    expect(program.duration, jsonData['duration']);
    expect(program.asciiName, jsonData['asciiName']);
    expect(program.guests, jsonData['guests']);
    expect(program.imageUrl, jsonData['imageUrl']);
    expect(program.isVideo, jsonData['isVideo']);
    expect(program.status, jsonData['status']);
  });
}
