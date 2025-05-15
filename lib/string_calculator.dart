import 'package:flutter/cupertino.dart';

class StringCalculator {
  int add(String value) {
    debugPrint('\n');
    debugPrint('Input  ---> $value');
    if (value.isEmpty) {
      return 0;
    } else {
      var separator = ',';
      if (value.startsWith('//')) {
        List<String> parts = value.split('\n');
        separator = parts[0].substring(2);
        value = parts.sublist(1).join('\n');

        debugPrint('parts  ---> $parts'); //parts  ---> [//;, 1;2]
        debugPrint('separator  ---> $separator'); //  ---> ;
        debugPrint('delimiter value ---> $value');
      }

      // Replace newlines with the separator
      value = value.replaceAll('\n', separator);

      // split the items from the list with separator
      var newList = value.split(separator).map(int.tryParse).toList();

      debugPrint('newList  ---> $newList');
      // Check for negative numbers
      final negativeNumbers = newList.where((n) => n! < 0).toList();
      if (negativeNumbers.isNotEmpty) {
        throw Exception(
            'Negative numbers not allowed: ${negativeNumbers.join(', ')}');
      }

      var total = newList.fold(0, (sum, n) => sum + n!);
      debugPrint('Output ---> $total');
      return total;
    }
  }
}
