import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/presentation/cubit/add_string_cubit.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/presentation/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:add_string_calculator_tdd/tdd_with_clean/features/string_calculator/injection_container_auth.dart'
    as demo_sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await demo_sl.init();
  runApp(const MyApp());
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name == '/') {
    return _buildRoute(
        settings,
        BlocProvider(
            create: (_) => demo_sl.demoSl<AddStringCubit>()..getList(),
            child: const MyHomePage()));
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add String Calculator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: _getRoute,
    );
  }
}
