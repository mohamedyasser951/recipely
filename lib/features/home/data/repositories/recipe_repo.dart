import 'package:dartz/dartz.dart';
import 'package:recipely/features/home/data/datasources/remote_data_source.dart';
import 'package:recipely/features/home/data/models/product_model/recipe_model.dart';
import 'package:recipely/services/network/api_exceptions.dart';

class RecipeRepository {
  RecipeRemoteDataSource recipeRemoteDataSource;
  RecipeRepository({
    required this.recipeRemoteDataSource,
  });
  Future<Either<String, RecipeModel>> getAllRecipesByLimit(
      {required int limit, required int skip}) async {
    try {
      RecipeModel recipeModel = await recipeRemoteDataSource
          .getAllRecipesByLimit(limit: limit, skip: skip);
      print(recipeModel);
      return Right(recipeModel);
    } on ApiException catch (e){
      return  Left(e.message);
    }
  }
}
