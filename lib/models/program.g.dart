// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Program _$$_ProgramFromJson(Map<String, dynamic> json) => _$_Program(
      id: json['id'],
      stationId: json['stationId'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      information: json['information'] as String,
      performers: (json['performers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      copyright: json['copyright'] as String,
      episodeId: json['episodeId'],
      episodeName: json['episodeName'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      duration: json['duration'],
      asciiName: json['asciiName'] as String,
      guests:
          (json['guests'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String,
      isVideo: json['isVideo'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_ProgramToJson(_$_Program instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stationId': instance.stationId,
      'name': instance.name,
      'url': instance.url,
      'description': instance.description,
      'information': instance.information,
      'performers': instance.performers,
      'copyright': instance.copyright,
      'episodeId': instance.episodeId,
      'episodeName': instance.episodeName,
      'datetime': instance.datetime.toIso8601String(),
      'duration': instance.duration,
      'asciiName': instance.asciiName,
      'guests': instance.guests,
      'imageUrl': instance.imageUrl,
      'isVideo': instance.isVideo,
      'status': instance.status,
    };
