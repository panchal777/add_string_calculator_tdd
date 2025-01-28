import 'package:flutter/cupertino.dart';

class StringCalculator {
  int add(String value) {
    /*
    * Input: “”, Output: 0
      Input: “1”, Output: 1
      Input: “1,5”, Output: 6
      ("1\n2,3" should return 6)
    * */
    if (value.isEmpty) {
      return 0;
    } else {
      /*-------------------------------------------------------*/
      var separator = ',';
      value = value.replaceAll('\n', separator);
      var newList = value.split(separator).map(int.tryParse).toList();
      var total = newList.fold(0, (sum, n) => sum + n!);
      debugPrint('sum ---> $total');
      return total;
    }
  }
}
