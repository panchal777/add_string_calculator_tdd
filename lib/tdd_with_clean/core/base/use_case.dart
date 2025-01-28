import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'base_failures.dart';

abstract class UseCase<Type, T> {
  Future<Either<Failure, Type>> callCase(T params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
