import 'package:add_string_calculator_tdd/string_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  final calculator = StringCalculator();

  // Test cases
  debugPrint(calculator.add("").toString()); // Output: 0
  debugPrint(calculator.add("1").toString()); // Output: 1
  debugPrint(calculator.add("1,5").toString()); // Output: 6
  debugPrint(calculator.add("1\n2,3").toString()); // Output: 6
  debugPrint(calculator.add("//;\n1;2").toString()); // Output: 3

  try {
    calculator.add("1,-2,3,-4");
  } catch (e) {
    debugPrint(e.toString()); // Output: Negative numbers not allowed: -2, -4
  }
}
