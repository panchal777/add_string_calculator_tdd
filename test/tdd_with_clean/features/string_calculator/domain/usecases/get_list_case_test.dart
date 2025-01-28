import 'package:add_string_calculator_tdd/tdd_with_clean/core/base/use_case.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/models/demo_list_model.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/domain/repositories/add_string_repository.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/domain/usecases/get_list_case.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_list_case_test.mocks.dart';

// class MockAddStringRepository extends Mock implements AddStringRepository {}

@GenerateMocks([AddStringRepository])
void main() {
  late GetListCase getListCase;
  late MockAddStringRepository mockAddStringRepository;

  setUp(() {
    mockAddStringRepository = MockAddStringRepository();
    getListCase = GetListCase(mockAddStringRepository);
  });

  final demoList = DemoListModel().getList();

  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockAddStringRepository.getList())
          .thenAnswer((_) async => Right(demoList));
      // act
      final result = await getListCase.callCase(NoParams());
      // assert
      expect(result, Right(demoList));
      verify(mockAddStringRepository.getList());
      verifyNoMoreInteractions(mockAddStringRepository);
    },
  );
}
