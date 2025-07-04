import 'package:add_string_calculator_tdd/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    final calculator = StringCalculator();

    /*------------Input: “”, Output: 0*------------*/
    test('should return 0 for an empty string', () {
      expect(calculator.add(''), equals(0));
    });

    /*------------Input: “1”, Output: 1------------*/
    test('should return number itself if number length is 1', () {
      expect(calculator.add('1'), equals(1));
    });

    /*------------Input: “1,5”, Output: 6------------*/
    test('should return the sum of two numbers', () {
      expect(calculator.add('1,5'), equals(6));
    });

    /*------------Input: “1\n2,3”, Output: 6------------*/
    test('should handle new lines and do sum of items in the list', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    /*--------//[delimiter]\n[numbers…]------------> Input: “//;\n1;2”, Output: 3------------*/
    test('should to handle new lines', () {
      expect(calculator.add('//;\n1;2'), equals(3));
    });

    /*--------'1,-2,3,-4'-----------*/
    test('should throw an exception for negative numbers', () {
      expect(
          () => calculator.add('1,-2,3,-4'),
          throwsA(predicate((e) =>
              e.toString().contains('Negative numbers not allowed: -2, -4'))));
    });
  });
}
