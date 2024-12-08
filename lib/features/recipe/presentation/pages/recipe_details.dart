import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipely/constants/colors.dart';

import 'package:recipely/features/recipe/data/models/product_model/recipe.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage({
    super.key,
    required this.recipe,
  });
  static const recipeDetailsPageKey = "RecipeDetailsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: recipe.id.toString(),
                  child: CachedNetworkImage(
                    height: 240,
                    width: double.infinity,
                    imageUrl: recipe.image!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 8,
                  top: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Icon(
                      Icons.bookmark,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          recipe.name!,
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "${recipe.rating!} rate",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),

                  Wrap(
                    children: recipe.tags!.map(
                      (ingredient) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "$ingredient ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),

                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // for (dynamic i in recipe.ingredients!) ...[
                  Wrap(
                    children: recipe.ingredients!.map(
                      (ingredient) {
                        //  String e =   ingredient.s
                        return Text(
                          "$ingredient ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Instructions",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Wrap(
                    children: recipe.instructions!.map(
                      (ingredient) {
                        return Text(
                          "$ingredient ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
