import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:space_clean/feature/data/models/space_media_model.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';

import '../../../mock/space_media_mock.dart';

void main() {
  const fakeSpaceMediaModel = SpaceMediaModel(
      description: 'teste',
      mediaType: 'teste',
      title: 'teste',
      mediaUrl: 'teste');

  test('should be a subclass of SpaceMediaEntity', () {
    expect(fakeSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, fakeSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expectedMap = {
      "explanation": "teste",
      "media_type": "teste",
      "title": "teste",
      "url": "teste"
    };

    final result = fakeSpaceMediaModel.toJson();

    expect(result['title'],expectedMap['title']);
    expect(result['media_type'],expectedMap['media_type']);
    expect(result['url'],expectedMap['url']);
  });
}
