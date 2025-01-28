import '../models/demo_list_model.dart';

abstract class AddStringSrc {
  Future<int> addString(String value);

  Future<List<DemoListModel>> getList();
}
