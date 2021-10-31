import 'package:space_clean/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:space_clean/core/usecase/usercase.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';
import 'package:space_clean/feature/domain/repositories/space_media_repository.dart';

class GetSpaceFromDateMediaUsecase implements Usercase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceFromDateMediaUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
