import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/datasource/add_string_src_impl.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/data/models/demo_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AddStringSrcImpl addStringSrcImpl;

  setUp(() {
    addStringSrcImpl = AddStringSrcImpl();
  });

  group('getList', () {
    group('getList from local src impl', () {
      final demoList = DemoListModel().getList();
      test(
        'should fetch list',
        () async {
          // act
          List<DemoListModel> result = await addStringSrcImpl.getList();
          // assert
          expect(result.length, equals(demoList.length));
        },
      );
    });
  });

  group('string calculator', () {
    group('getList from local src impl', () {
      final demoList = DemoListModel().getList();

      /*------------Input: “”, Output: 0*------------*/

      test(
        'should return 0 for an empty string',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[0].input);
          // assert
          expect(result, equals(0));
        },
      );

      /*------------Input: “1”, Output: 1------------*/

      test(
        'should return number itself if number length is 1',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[1].input);
          // assert
          expect(result, equals(1));
        },
      );

      /*------------Input: “1,5”, Output: 6------------*/
      test(
        'should return the sum of two numbers',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[2].input);
          // assert
          expect(result, equals(6));
        },
      );

      /*------------Input: “1\n2,3”, Output: 6------------*/
      test(
        'should handle new lines and do sum of items in the list',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[3].input);
          // assert
          expect(result, equals(6));
        },
      );

      /*--------//[delimiter]\n[numbers…]------------> Input: “//;\n1;2”, Output: 3------------*/
      test(
        'should to handle new lines',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[4].input);
          // assert
          expect(result, equals(3));
        },
      );

      /*--------'1,-2,3,-4'-----------*/
      test(
        'should throw an exception for negative numbers',
        () async {
          // act
          int result = await addStringSrcImpl.addString(demoList[5].input);
          // assert
          expect(result, equals(3));
        },
      );
    });
  });
}
