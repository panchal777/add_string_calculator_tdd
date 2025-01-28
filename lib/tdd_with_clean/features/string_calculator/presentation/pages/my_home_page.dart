import 'package:flutter/material.dart';
import '../widgets/sum_list_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('String Calculator')),
        body: Center(child: SumListWidget()));
  }
}
