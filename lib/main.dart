import 'package:flutter/material.dart';
import 'package:recipely/features/layout/presentation/pages/main_layout.dart';
import 'package:recipely/services/serviceLoactor/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainLayout(),
    );
  }
}
