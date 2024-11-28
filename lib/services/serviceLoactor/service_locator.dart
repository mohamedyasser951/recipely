import 'package:get_it/get_it.dart';
import 'package:recipely/features/layout/presentation/cubit/layout_cubit.dart';

class ServiceLocator {
  static GetIt sl = GetIt.instance;

  static Future init() async {
    sl.registerLazySingleton<BottomNavCubit>(
      () => BottomNavCubit(),
    );
  }
}
