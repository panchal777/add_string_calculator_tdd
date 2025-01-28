// import 'package:add_string_calculator_tdd/tdd_with_clean/core/base/base_failures.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/core/base/use_case.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/models/demo_list_model.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/domain/usecases/add_string_case.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/domain/usecases/get_list_case.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/presentation/cubit/add_string_cubit.dart';
// import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/presentation/cubit/add_string_cubit_state.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import 'add_string_cubit_test.mocks.dart';
//
// // Mock classes
// // class MockAddStringCase extends Mock implements AddStringCase {}
// //
// // class MockGetListCase extends Mock implements GetListCase {}
//
// @GenerateMocks([AddStringCase, GetListCase])
// void main() {
//   late AddStringCubit addStringCubit;
//   late MockAddStringCase mockAddStringCase;
//   late MockGetListCase mockGetListCase;
//
//   setUp(() {
//     mockAddStringCase = MockAddStringCase();
//     mockGetListCase = MockGetListCase();
//     addStringCubit = AddStringCubit(
//       addStringCase: mockAddStringCase,
//       getListCase: mockGetListCase,
//     );
//   });
//
//   tearDown(() {
//     addStringCubit.close();
//   });
//
//   group('AddStringCubit Tests', () {
//     var demoList = DemoListModel().getList();
//
//     blocTest<AddStringCubit, AddStringCubitState>(
//       'emits [GetListSuccessState] when getList is successful',
//       build: () {
//         when(mockGetListCase.callCase(NoParams()))
//             .thenAnswer((_) async => Right(demoList));
//         return addStringCubit;
//       },
//       act: (cubit) => cubit.getList(),
//       expect: () => [GetListSuccessState(list: demoList)],
//       verify: (_) {
//         verify(mockGetListCase.callCase(NoParams())).called(1);
//       },
//     );
//
//     blocTest<AddStringCubit, AddStringCubitState>(
//       'emits [AddStringErrorState] when getList fails',
//       build: () {
//         when(mockGetListCase.callCase(NoParams()))
//             .thenAnswer((_) async => Left(FailureMessage('Error occurred')));
//         return addStringCubit;
//       },
//       act: (cubit) => cubit.getList(),
//       expect: () => [
//         AddStringErrorState('Exception: Error occurred'),
//       ],
//       verify: (_) {
//         verify(mockGetListCase.callCase(NoParams())).called(1);
//       },
//     );
//
//     blocTest<AddStringCubit, AddStringCubitState>(
//       'emits [AddStringSuccessState] when addStringCalculator is successful',
//       build: () {
//         when(mockAddStringCase.callCase('inputValue'))
//             .thenAnswer((_) async => Right(42));
//         return addStringCubit;
//       },
//       act: (cubit) => cubit.addStringCalculator('inputValue', 1),
//       expect: () => [
//         AddStringSuccessState(
//           value: '42',
//           msg: 'Total value is 42',
//           index: 1,
//         ),
//       ],
//       verify: (_) {
//         verify(mockAddStringCase.callCase('inputValue')).called(1);
//       },
//     );
//
//     blocTest<AddStringCubit, AddStringCubitState>(
//       'emits [AddStringErrorState] when addStringCalculator fails',
//       build: () {
//         when(mockAddStringCase.callCase('inputValue'))
//             .thenAnswer((_) async => Left(FailureMessage('Error occurred')));
//         return addStringCubit;
//       },
//       act: (cubit) => cubit.addStringCalculator('inputValue', 1),
//       expect: () => [
//         AddStringErrorState('Exception: Error occurred'),
//       ],
//       verify: (_) {
//         verify(mockAddStringCase.callCase('inputValue')).called(1);
//       },
//     );
//   });
// }
