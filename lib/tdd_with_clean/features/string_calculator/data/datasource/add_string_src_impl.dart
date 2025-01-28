import 'package:add_string_calculator_tdd/string_calculator.dart';

import '../models/demo_list_model.dart';
import 'add_string_src.dart';

class AddStringSrcImpl extends AddStringSrc {
  var calculator = StringCalculator();

  @override
  Future<List<DemoListModel>> getList() async {
    return DemoListModel().getList();
  }

  @override
  Future<int> addString(String value) async {
    return calculator.add(value);
  }
}
