import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/datasource/add_string_src.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/models/demo_list_model.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/repositories/add_string_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'add_string_repository_test.mocks.dart';

// class MockAddStringSrc extends Mock implements AddStringSrc {}
@GenerateMocks([AddStringSrc])
void main() {
  late MockAddStringSrc mockAddStringSrc;
  late AddStringRepositoryImpl addStringRepository;

  setUp(() {
    mockAddStringSrc = MockAddStringSrc();
    addStringRepository = AddStringRepositoryImpl(mockAddStringSrc);
  });

  group('getList', () {
    final demoList = DemoListModel().getList();

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockAddStringSrc.getList()).thenAnswer((_) async => demoList);
        // act
        final result = await addStringRepository.getList();
        // assert
        verify(mockAddStringSrc.getList());
        expect(result, equals(Right(demoList)));
      },
    );
  });
}
