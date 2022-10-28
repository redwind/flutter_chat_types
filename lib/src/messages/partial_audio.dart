import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../message.dart';
import 'audio_message.dart';

@immutable
class PartialAudio {
  /// Creates a partial audio message with all variables audio can have.
  /// Use [AudioMessage] to create a full message.
  /// You can use [AudioMessage.fromPartial] constructor to create a full
  /// message from a partial one.
  const PartialAudio({
    required this.length,
    this.mimeType,
    this.waveForm,
    required this.uri,
  });

  /// Creates a partial audio message from a map (decoded JSON).
  PartialAudio.fromJson(Map<String, dynamic> json)
      : length = Duration(milliseconds: json['length'] as int),
        mimeType = json['mimeType'] as String?,
        waveForm =
            json['waveForm'] != null ? json['waveForm'] as List<double> : null,
        uri = json['uri'] as String;

  /// Converts a partial audio message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'length': length,
        'mimeType': mimeType,
        'waveForm': waveForm,
        'uri': uri,
      };

  /// The length of the audio
  final Duration length;

  /// Media type
  final String? mimeType;

  /// Wave form represented as a list of decibel level, each comprised between 0 and 120
  final List<double>? waveForm;

  /// The audio file source (either a remote URL or a local resource)
  final String uri;
}
