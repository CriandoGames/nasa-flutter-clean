import 'package:space_clean/feature/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  const SpaceMediaModel(
      {required description,
      required mediaType,
      required title,
      required mediaUrl})
      : super(
            description: description,
            mediaType: mediaType,
            title: title,
            mediaUrl: mediaUrl);

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      SpaceMediaModel(
          description: json['explanation'],
          mediaType: json['media_type'],
          title: json['title'],
          mediaUrl: json['url']);

  Map<String, dynamic> toJson() => {
        'explanation:': description,
        'media_type': mediaType,
        'title': title,
        'url': mediaUrl
      };
}
