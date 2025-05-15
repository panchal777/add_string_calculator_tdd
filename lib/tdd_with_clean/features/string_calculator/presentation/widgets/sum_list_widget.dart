import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/common.dart';
import '../../data/models/demo_list_model.dart';
import '../cubit/add_string_cubit.dart';
import '../cubit/add_string_cubit_state.dart';

class SumListWidget extends StatefulWidget {
  const SumListWidget({super.key});

  @override
  State<SumListWidget> createState() => _SumListWidgetState();
}

class _SumListWidgetState extends State<SumListWidget> {
  List<DemoListModel> demoList = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddStringCubit, AddStringCubitState>(
      listener: (context, state) {
        if (state is AddStringSuccessState) {
          Common.showToast(msg: 'Output is ${state.value}');
        } else if (state is AddStringErrorState) {
          Common.showToast(msg: state.msg, isError: true);
        }
      },
      child: BlocBuilder<AddStringCubit, AddStringCubitState>(
          builder: (context, state) {
        if (state is StateInitial || state is StateLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetListSuccessState) {
          demoList = state.list;
        } else if (state is AddStringSuccessState) {
          demoList[state.index].output = state.value;
        } else if (state is AddStringErrorState) {
          if (state.index != null) {
            demoList[state.index!].output = state.msg;
          }
        }

        return demoList.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: demoList.length,
                itemBuilder: (context, index) {
                  var data = demoList[index];

                  return GestureDetector(
                    onTap: () {
                      onTapItem(index, context);
                    },
                    child: Card(
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 10, left: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}: ${data.label}',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            rowValue('Input', data.inputLabel),
                            const SizedBox(height: 5),
                            rowValue(
                              'Output',
                              data.output.isNotEmpty
                                  ? data.output
                                  : 'Tap to see the result',
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text('No Records Found'));
      }),
    );
  }

  Widget rowValue(String title, dynamic value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title:'),
        const SizedBox(width: 4),
        Expanded(child: Text(value.toString()))
      ],
    );
  }

  onTapItem(index, context) async {
    //add all values of string
    BlocProvider.of<AddStringCubit>(context)
        .addStringCalculator(demoList[index].input, index);
  }
}
