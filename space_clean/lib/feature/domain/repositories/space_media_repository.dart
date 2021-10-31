import 'package:dartz/dartz.dart';
import 'package:space_clean/core/errors/failure.dart';
import 'package:space_clean/feature/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}
