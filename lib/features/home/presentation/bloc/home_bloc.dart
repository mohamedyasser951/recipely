import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipely/features/home/data/models/product_model/recipe.dart';
import 'package:recipely/features/home/data/repositories/recipe_repo.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  RecipeRepository recipeRepository;
  HomeBloc({
    required this.recipeRepository,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllRecipesByLimit) {
        emit(state.copyWith(status: Status.loading));
        var failureOrData =
            await recipeRepository.getAllRecipesByLimit(limit: 10, skip: 10);
        failureOrData.fold((l) {
          print(l.toString());
          emit(state.copyWith(
            errorMessage: l.toString(),
            status: Status.error,
          ));
          print(l);
        }, (r) {
          emit(state.copyWith(
            recipes: r.recipes,
            status: Status.success,
          ));
          print(r.recipes);
        });
      }
    });
  }
}
