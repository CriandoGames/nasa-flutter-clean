import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_clean/core/errors/failure.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';
import 'package:space_clean/feature/domain/repositories/space_media_repository.dart';
import 'package:space_clean/feature/domain/usecases/get_space_media_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceFromDateMediaUsecase sut;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    sut = GetSpaceFromDateMediaUsecase(repository);
  });

  const fakeResponseSpaceMedia = SpaceMediaEntity(
      description: 'teste de ddd',
      mediaType: 'imgage',
      title: 'teste',
      mediaUrl: 'http://teste.com');

  final fakeDate = DateTime(2021, 02, 02);

  test('Should get space media entity from for a given date from repository',
      () async {
    when(() => repository.getSpaceMediaFromDate(fakeDate))
        .thenAnswer((_) async => const Right(fakeResponseSpaceMedia));
    final result = await sut(fakeDate);

    expect(result, const Right(fakeResponseSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(fakeDate)).called(1);
  });


  test('Should get space media entity from for a given date from repository with paramets correct',
      () async {
    when(() => repository.getSpaceMediaFromDate(fakeDate))
        .thenAnswer((_) async => const Right(fakeResponseSpaceMedia));
    final result = await sut(fakeDate);

    expect(result, const Right(fakeResponseSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(fakeDate));
    
  });


  test('Should return a failure when don\'t sucessed', () async {
    when(() => repository.getSpaceMediaFromDate(fakeDate))
        .thenAnswer((_) async => Left(ServerFailure()));
    final result = await sut(fakeDate);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(fakeDate)).called(1);
    
  });
}
