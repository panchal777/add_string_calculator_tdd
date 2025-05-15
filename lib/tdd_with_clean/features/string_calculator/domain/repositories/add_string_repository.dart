import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../data/models/demo_list_model.dart';

abstract class AddStringRepository {
  Future<Either<Failure, int>> addString(String value);

  Future<Either<Failure, List<DemoListModel>>> getList();
}
