import 'package:equatable/equatable.dart';
<<<<<<< HEAD
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'preview_data.g.dart';

/// A class that represents data obtained from the web resource (link preview).
///
/// See https://github.com/flyerhq/flutter_link_previewer
@JsonSerializable()
=======
import 'package:meta/meta.dart';

/// A class that represents data obtained from the web resource (link preview).
///
/// See https://github.com/flyerhq/flutter_link_previewer
>>>>>>> feature/audio_message_types
@immutable
class PreviewData extends Equatable {
  /// Creates preview data.
  const PreviewData({
    this.description,
    this.image,
    this.link,
    this.title,
  });

  /// Creates preview data from a map (decoded JSON).
<<<<<<< HEAD
  factory PreviewData.fromJson(Map<String, dynamic> json) =>
      _$PreviewDataFromJson(json);

  /// Converts preview data to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$PreviewDataToJson(this);
=======
  PreviewData.fromJson(Map<String, dynamic> json)
      : description = json['description'] as String?,
        image = json['image'] == null
            ? null
            : PreviewDataImage.fromJson(json['image'] as Map<String, dynamic>),
        link = json['link'] as String?,
        title = json['title'] as String?;

  /// Converts preview data to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'description': description,
        'image': image?.toJson(),
        'link': link,
        'title': title,
      };
>>>>>>> feature/audio_message_types

  /// Creates a copy of the preview data with an updated data.
  /// Null values will nullify existing values.
  PreviewData copyWith({
    String? description,
    PreviewDataImage? image,
    String? link,
    String? title,
  }) {
    return PreviewData(
      description: description,
      image: image,
      link: link,
      title: title,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [description, image, link, title];

  /// Link description (usually og:description meta tag)
  final String? description;

  /// See [PreviewDataImage]
  final PreviewDataImage? image;

  /// Remote resource URL
  final String? link;

  /// Link title (usually og:title meta tag)
  final String? title;
}

/// A utility class that forces image's width and height to be stored
/// alongside the url.
///
/// See https://github.com/flyerhq/flutter_link_previewer
<<<<<<< HEAD
@JsonSerializable()
=======
>>>>>>> feature/audio_message_types
@immutable
class PreviewDataImage extends Equatable {
  /// Creates preview data image.
  const PreviewDataImage({
    required this.height,
    required this.url,
    required this.width,
  });

  /// Creates preview data image from a map (decoded JSON).
<<<<<<< HEAD
  factory PreviewDataImage.fromJson(Map<String, dynamic> json) =>
      _$PreviewDataImageFromJson(json);

  /// Converts preview data image to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$PreviewDataImageToJson(this);
=======
  PreviewDataImage.fromJson(Map<String, dynamic> json)
      : height = json['height'] as double,
        url = json['url'] as String,
        width = json['width'] as double;

  /// Converts preview data image to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'height': height,
        'url': url,
        'width': width,
      };
>>>>>>> feature/audio_message_types

  /// Equatable props
  @override
  List<Object> get props => [height, url, width];

  /// Image height in pixels
  final double height;

  /// Remote image URL
  final String url;

  /// Image width in pixels
  final double width;
}
