import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:space_clean/core/errors/failure.dart';

abstract class Usercase<Output,Input> {
  Future<Either<Failure,Output>> call(Input params); 
}


class NoParams  extends Equatable{
  @override
  List<Object?> get props => [];

}