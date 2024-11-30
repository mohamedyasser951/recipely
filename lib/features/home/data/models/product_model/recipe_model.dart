import 'recipe.dart';

class RecipeModel {
  List<Recipe>? recipes;
  int? total;
  int? skip;
  int? limit;

  RecipeModel({this.recipes, this.total, this.skip, this.limit});

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipes: (json['recipes'] as List<dynamic>?)
            ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'recipes': recipes?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
