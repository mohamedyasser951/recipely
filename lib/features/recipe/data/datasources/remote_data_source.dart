import 'package:dartz/dartz.dart';
import 'package:recipely/features/recipe/data/models/product_model/recipe_model.dart';
import 'package:recipely/services/network/dio_consumer.dart';
import 'package:recipely/services/network/failure.dart';

abstract class RecipeRemoteDataSource {
  Future<Either<Failure, RecipeModel>> getAllRecipesByLimit({int skip});
}

class RecipeRemoteDataSourceImplem implements RecipeRemoteDataSource {
  DioConsumer dioConsumer;
  RecipeRemoteDataSourceImplem({
    required this.dioConsumer,
  });

  @override
  Future<Either<Failure, RecipeModel>> getAllRecipesByLimit({int? skip}) async {
    var data = await dioConsumer.get(
        url: "https://dummyjson.com/recipes?limit=4&skip=$skip");
    return data.fold(
      (error) => left(error),
      (recipes) => right(RecipeModel.fromJson(recipes)),
    );
  }
}
