import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../domain/repositories/add_string_repository.dart';
import '../datasource/add_string_src.dart';
import '../models/demo_list_model.dart';

class AddStringRepositoryImpl extends AddStringRepository {
  AddStringSrc addStringSrc;

  AddStringRepositoryImpl(this.addStringSrc);

  @override
  Future<Either<Failure, int>> addString(String value) async {
    try {
      var response = await addStringSrc.addString(value);
      return Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<DemoListModel>>> getList() async {
    try {
      var response = await addStringSrc.getList();
      return Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      return Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    return FailureMessage(e.toString());
  }
}
