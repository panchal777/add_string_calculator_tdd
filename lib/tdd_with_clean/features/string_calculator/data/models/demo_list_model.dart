class DemoListModel {
  String label;
  String inputLabel;
  String input;
  String output;
  String msg;

  DemoListModel({
    this.msg = '',
    this.inputLabel = '',
    this.input = '',
    this.label = '',
    this.output = '',
  });

  List<DemoListModel> getList() {
    return [
      DemoListModel(
        label: 'Should return 0 for an empty string',
        input: '',
        inputLabel: 'Empty String',
      ),
      DemoListModel(
        label: 'Should return number itself if number length is 1',
        inputLabel: '1',
        input: '1',
      ),
      DemoListModel(
        label: 'Should return the sum of two numbers',
        inputLabel: '1,5',
        input: '1,5',
      ),
      DemoListModel(
        label: 'Should handle new lines and do sum of items in the list',
        inputLabel: '1\\n2,3',
        input: '1\n2,3',
      ),
      DemoListModel(
        label: 'Should to handle new lines',
        inputLabel: '//;\\n1;2',
        input: '//;\n1;2',
      ),
      DemoListModel(
        label: 'Should throw an exception for negative numbers',
        inputLabel: '1,-2,3,-4',
        input: '1,-2,3,-4',
      )
    ];
  }
}
