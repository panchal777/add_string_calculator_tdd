import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../domain/usecases/add_string_case.dart';
import '../../domain/usecases/get_list_case.dart';
import 'add_string_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStringCubit extends Cubit<AddStringCubitState> {
  AddStringCase? addStringCase;
  GetListCase? getListCase;

  AddStringCubit({this.addStringCase, this.getListCase})
      : super(StateInitial());

  getList() async {
    var data = await getListCase!.callCase(NoParams());

    data.fold((onError) {
      emit(AddStringErrorState(checkError(onError)));
    }, (list) {
      emit(GetListSuccessState(list: list));
    });
  }

  addStringCalculator(String value, int index) async {
    var data = await addStringCase!.callCase(value);

    data.fold((onError) {
      emit(AddStringErrorState(checkError(onError), index: index));
    }, (sum) {
      emit(AddStringSuccessState(
          value: sum.toString(), msg: 'Total value is $sum', index: index));
    });
  }

  checkError(Failure onError) {
    if (onError is FailureMessage) {
      return onError.message;
    } else {
      return 'Something went wrong';
    }
  }
}
