import 'package:dartz/dartz.dart';
import 'package:recipely/features/recipe/data/datasources/remote_data_source.dart';
import 'package:recipely/features/recipe/data/models/product_model/recipe_model.dart';
import 'package:recipely/services/network/failure.dart';

class RecipeRepository {
  RecipeRemoteDataSource recipeRemoteDataSource;
  RecipeRepository({
    required this.recipeRemoteDataSource,
  });
  Future<Either<Failure, RecipeModel>> getAllRecipesByLimit({int? skip}) async {
    return recipeRemoteDataSource.getAllRecipesByLimit(skip: skip!);
  }
}
