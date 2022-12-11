import 'package:freezed_annotation/freezed_annotation.dart';

part 'program.freezed.dart';
part 'program.g.dart';

@freezed
abstract class Program with _$Program {
  const factory Program({
    required dynamic id,
    required String stationId,
    required String name,
    required String url,
    required String description,
    required String information,
    required List<String> performers,
    required String copyright,
    required dynamic episodeId,
    required String episodeName,
    required DateTime datetime,
    required dynamic duration,
    required String asciiName,
    required List<String> guests,
    required String imageUrl,
    required bool isVideo,
    required String status,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json)
    => _$ProgramFromJson(json);
}
