import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../data/models/demo_list_model.dart';
import '../repositories/add_string_repository.dart';

class GetListCase extends UseCase<List<DemoListModel>, NoParams> {
  AddStringRepository addStringRepository;

  GetListCase(this.addStringRepository);

  @override
  Future<Either<Failure, List<DemoListModel>>> callCase(NoParams params) {
    return addStringRepository.getList();
  }
}
