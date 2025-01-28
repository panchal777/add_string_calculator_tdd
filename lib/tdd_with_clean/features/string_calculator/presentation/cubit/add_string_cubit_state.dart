import '../../data/models/demo_list_model.dart';

abstract class AddStringCubitState {
  const AddStringCubitState();
}

class StateInitial extends AddStringCubitState {}

class StateLoading extends AddStringCubitState {}

class GetListSuccessState extends AddStringCubitState {
  final List<DemoListModel> list;

  const GetListSuccessState({required this.list});
}

class AddStringSuccessState extends AddStringCubitState {
  final String msg;
  final String value;
  final int index;

  const AddStringSuccessState(
      {required this.msg, required this.value, required this.index});
}

class AddStringErrorState extends AddStringCubitState {
  final String msg;
  final int? index;

  const AddStringErrorState(this.msg, {this.index});
}
