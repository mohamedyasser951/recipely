import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/constants/bloc_observer.dart';
import 'package:recipely/features/layout/presentation/pages/main_layout.dart';
import 'package:recipely/services/serviceLoactor/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
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
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.white))),
      home: const MainLayout(),
    );
  }
}
