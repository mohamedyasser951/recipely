import 'package:dio/dio.dart';
import 'package:recipely/features/home/data/models/product_model/recipe_model.dart';
import 'package:recipely/services/network/api_exceptions.dart';

abstract class RecipeRemoteDataSource {
  Future<RecipeModel> getAllRecipesByLimit(
      {required int limit, required int skip});
}

class RecipeRemoteDataSourceImplem implements RecipeRemoteDataSource {
  Dio dio;
  RecipeRemoteDataSourceImplem({
    required this.dio,
  });

  @override
  Future<RecipeModel> getAllRecipesByLimit(
      {required int limit, required int skip}) async {
    try {
      Response response =
          await dio.get("https://dummyjson.com/recipes?limit=20&skip=$skip");
      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.data);
      } else {
        throw ApiException("Unexpected error: ${response.statusCode}");
      }
    } on DioException catch (error) {
      throw ApiException(ApiException.handleError(error));
    }
  }
}
