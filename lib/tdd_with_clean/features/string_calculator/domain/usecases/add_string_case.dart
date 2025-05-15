import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../repositories/add_string_repository.dart';

class AddStringCase extends UseCase<int, String> {
  AddStringRepository addStringRepository;

  AddStringCase(this.addStringRepository);

  @override
  Future<Either<Failure, int>> callCase(String params) {
    return addStringRepository.addString(params);
  }
}
