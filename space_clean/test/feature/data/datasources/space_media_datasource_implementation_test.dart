import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_clean/core/errors/execeptions.dart';
import 'package:space_clean/core/http_client/http_client.dart';
import 'package:space_clean/feature/data/datasources/space_media_datasource.dart';
import 'package:space_clean/feature/data/datasources/space_media_datasource_implementation.dart';
import 'package:space_clean/feature/data/models/space_media_model.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';

import '../../../mock/space_media_mock.dart';

class HttpClientMocking extends Mock implements HttpClient {}

main() {
  late ISpaceMediaDatasource sut;
  late HttpClient client;

  void sucessMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  setUp(() {
    client = HttpClientMocking();
    sut = NasaDatasourceImplementation(client);
  });

  final fakeDateTime = DateTime(2021, 02, 02);
  const url =
      'https://api.nasa.gov/planetary/apod?api_key=5erFAd2FBv8MOUknSKcSnBv1ummYuBGT5hQztKZw=2021-02-02';
  test('should call the get method with correct url', () async {
    sucessMock();

    await sut.getSpaceMediaFromDate(fakeDateTime);

    verify(() => client.get(url)).called(1);
  });

  test('should return a SpaceMediaModel when is successfull', () async {
    sucessMock();

    const fakeSpaceMediaModelExpected = SpaceMediaModel(
        description: "teste",
        mediaType: "teste",
        title: "teste",
        mediaUrl: "teste");

    final result = await sut.getSpaceMediaFromDate(fakeDateTime);

    expect(result, fakeSpaceMediaModelExpected);
  });

  test('should thrown a ServerExecption When the call is unccessfull',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'something went error', statusCode: 400));

    final result = sut.getSpaceMediaFromDate(fakeDateTime);

    expect(() => result, throwsA(ServerException()));
  });
}
