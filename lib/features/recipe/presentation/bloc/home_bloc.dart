import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipely/features/recipe/data/models/product_model/recipe.dart';
import 'package:recipely/features/recipe/data/repositories/recipe_repo.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  RecipeRepository recipeRepository;
  HomeBloc({
    required this.recipeRepository,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllRecipesByLimit) {
        if (state.hasReashedMax) return;
        if (state.status == Status.loading) {
          var either = await recipeRepository.getAllRecipesByLimit(skip: 10);
          either.fold((error) {
            emit(state.copyWith(
              errorMessage: error.message.toString(),
              status: Status.error,
            ));
          }, (recipes) {
            recipes.recipes!.isEmpty
                ? emit(state.copyWith(
                    hasReashedMax: true,
                  ))
                : emit(state.copyWith(
                    recipes: recipes.recipes,
                    status: Status.success,
                    hasReashedMax: false));
          });
          if (state.recipes.isEmpty) return;
        } else {
          var either = await recipeRepository.getAllRecipesByLimit(
              skip: state.recipes.length);

          either.fold((error) {
            emit(state.copyWith(
              errorMessage: error.message.toString(),
              status: Status.error,
            ));
          }, (recipes) {
            if (recipes.recipes!.isEmpty) {
              emit(state.copyWith(
                hasReashedMax: true,
              ));
            } else {
              emit(state.copyWith(
                  recipes: List.of(state.recipes)..addAll(recipes.recipes!),
                  status: Status.success,
                  hasReashedMax: false));
            }
          });
        }
      }
    }, transformer: droppable());
  }
}
