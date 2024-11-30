import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:recipely/features/home/data/models/product_model/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 160,
              width: double.infinity,
              imageUrl: recipe.image!,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              recipe.name!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
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
                      recipe.rating!.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      recipe.cookTimeMinutes!.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
