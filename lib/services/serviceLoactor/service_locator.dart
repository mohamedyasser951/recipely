import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipely/features/home/data/datasources/remote_data_source.dart';
import 'package:recipely/features/home/data/repositories/recipe_repo.dart';
import 'package:recipely/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipely/features/layout/presentation/cubit/layout_cubit.dart';

class ServiceLocator {
  static Dio dio = Dio();

  static GetIt sl = GetIt.instance;

  static Future init() async {
    //Blocs
    sl.registerLazySingleton<BottomNavCubit>(
      () => BottomNavCubit(),
    );
    sl.registerLazySingleton<HomeBloc>(
      () => HomeBloc(recipeRepository: sl()),
    );

    //Repository
    sl.registerLazySingleton<RecipeRepository>(
      () => RecipeRepository(recipeRemoteDataSource: sl()),
    );

    //Data Sources
    sl.registerLazySingleton<RecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImplem(dio: sl()),
    );

    //External
    sl.registerLazySingleton<Dio>(
      () => dio,
    );
  }
}
