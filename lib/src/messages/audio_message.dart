import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;
import 'partial_audio.dart';

/// A class that represents file message.
@immutable
class AudioMessage extends Message {
  /// Creates an audio message.
  const AudioMessage({
    required User author,
    int? createdAt,
    required String id,
    required this.length,
    this.isLoading,
    Map<String, dynamic>? metadata,
    this.mimeType,
    this.waveForm,
    Status? status,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    int? updatedAt,
    required this.uri,
  }) : super(
          author,
          createdAt,
          id,
          metadata,
          remoteId,
          repliedMessage,
          roomId,
          showStatus,
          status,
          MessageType.audio,
          updatedAt,
        );

  /// Creates a full audio message from a partial one.
  AudioMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    this.isLoading,
    Map<String, dynamic>? metadata,
    required PartialAudio partialAudio,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  })  : length = partialAudio.length,
        mimeType = partialAudio.mimeType,
        waveForm = partialAudio.waveForm,
        uri = partialAudio.uri,
        super(
          author,
          createdAt,
          id,
          metadata,
          remoteId,
          repliedMessage,
          roomId,
          showStatus,
          status,
          MessageType.audio,
          updatedAt,
        );

  /// Creates an audio message from a map (decoded JSON).
  AudioMessage.fromJson(Map<String, dynamic> json)
      : length = Duration(milliseconds: json['length'] as int),
        mimeType = json['mimeType'] as String?,
        waveForm = json['waveForm'] != null ? json['waveForm'] : null,
        uri = json['uri'] as String,
        isLoading =
            json['isLoading'] != null ? json['isLoading'] as bool : false,
        super(
          User.fromJson(json['author'] as Map<String, dynamic>),
          json['createdAt'] as int?,
          json['id'] as String,
          json['metadata'] as Map<String, dynamic>?,
          json['remoteId'] as String?,
          json['repliedMessage'] == null
              ? null
              : Message.fromJson(
                  json['repliedMessage'] as Map<String, dynamic>),
          json['roomId'] as String?,
          json['showStatus'] as bool?,
          $enumDecodeNullable(_$StatusEnumMap, json['status']),
          MessageType.audio,
          json['updatedAt'] as int?,
        );

  /// Converts an audio message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => {
        'author': author.toJson(),
        'length': length.inMilliseconds,
        'id': id,
        'metadata': metadata,
        'remoteId': remoteId,
        'repliedMessage': repliedMessage?.toJson(),
        'roomId': roomId,
        'showStatus': showStatus,
        'mimeType': mimeType,
        'waveForm': waveForm,
        'status': status,
        'type': 'audio',
        'isLoading': isLoading,
        'uri': uri,
        'updatedAt': updatedAt,
      };

  /// Creates a copy of the audio message with an updated data
  @override
  Message copyWith({
    User? author,
    int? createdAt,
    bool? isLoading,
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    String? remoteId,
    bool? showStatus,
    Status? status,
    String? text,
    int? updatedAt,
    String? uri,
  }) {
    return AudioMessage(
      author: author ?? this.author,
      length: length,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      mimeType: mimeType,
      waveForm: waveForm,
      remoteId: remoteId,
      repliedMessage: repliedMessage,
      roomId: roomId,
      showStatus: showStatus,
      status: status ?? this.status,
      updatedAt: updatedAt,
      uri: uri ?? this.uri,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        author,
        length,
        createdAt,
        id,
        isLoading,
        metadata,
        mimeType,
        remoteId,
        repliedMessage,
        roomId,
        status,
        updatedAt,
        uri,
      ];

  /// Specify whether the message content is currently being loaded
  final bool? isLoading;

  /// The length of the audio
  final Duration length;

  /// Media type
  final String? mimeType;

  /// Wave form represented as a list of decibel level, each comprised between 0 and 120
  final List<double>? waveForm;

  /// The audio source (either a remote URL or a local resource)
  final String uri;
}

const _$StatusEnumMap = {
  Status.delivered: 'delivered',
  Status.error: 'error',
  Status.seen: 'seen',
  Status.sending: 'sending',
  Status.sent: 'sent',
};
