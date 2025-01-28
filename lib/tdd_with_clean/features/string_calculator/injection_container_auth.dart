import 'package:get_it/get_it.dart';
import 'data/datasource/add_string_src.dart';
import 'data/datasource/add_string_src_impl.dart';
import 'data/repositories/add_string_repository.dart';
import 'domain/repositories/add_string_repository.dart';
import 'domain/usecases/add_string_case.dart';
import 'domain/usecases/get_list_case.dart';
import 'presentation/cubit/add_string_cubit.dart';

final demoSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  demoSl.registerFactory(() => AddStringCubit(addStringCase: demoSl(),getListCase: demoSl()));

  // Use Cases
  demoSl.registerLazySingleton(() => AddStringCase(demoSl()));
  demoSl.registerLazySingleton(() => GetListCase(demoSl()));

  // Repository
  demoSl.registerLazySingleton<AddStringRepository>(
      () => AddStringRepositoryImpl(demoSl()));

  // Data sources
  demoSl.registerLazySingleton<AddStringSrc>(() => AddStringSrcImpl());
}
