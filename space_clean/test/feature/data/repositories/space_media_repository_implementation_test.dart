import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_clean/core/errors/execeptions.dart';
import 'package:space_clean/core/errors/failure.dart';
import 'package:space_clean/feature/data/datasources/space_media_datasource.dart';
import 'package:space_clean/feature/data/models/space_media_model.dart';
import 'package:space_clean/feature/data/repositories/space_media_repository_implementation.dart';


class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repositoty;
  late MockSpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repositoty = SpaceMediaRepositoryImplementation(datasource);
  });

  const fakeSpaceMediaModel = SpaceMediaModel(
      description: 'teste de ddd',
      mediaType: 'imgage',
      title: 'teste',
      mediaUrl: 'http://teste.com');

  final fakeDate = DateTime(2021, 02, 02);

  test('should return space media model when calls the datasource', () async {
    //arrange
    when(() => datasource.getSpaceMediaFromDate(fakeDate))
        .thenAnswer((_) async => fakeSpaceMediaModel);
    //Act
    final result = await repositoty.getSpaceMediaFromDate(fakeDate);
    //assert
    expect(result, const Right(fakeSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(fakeDate));
  });

  

  test(
      'should return a servver failure when call to datasource is unsucessfull',
      () async {
    //arrange
    when(() => datasource.getSpaceMediaFromDate(fakeDate))
        .thenThrow(ServerException());
    //Act
    final result = await repositoty.getSpaceMediaFromDate(fakeDate);
    //assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(fakeDate));
  });
}
