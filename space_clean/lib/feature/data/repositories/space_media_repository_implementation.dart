import 'package:space_clean/core/errors/execeptions.dart';
import 'package:space_clean/feature/data/datasources/space_media_datasource.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';
import 'package:space_clean/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:space_clean/feature/domain/repositories/space_media_repository.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      var result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
