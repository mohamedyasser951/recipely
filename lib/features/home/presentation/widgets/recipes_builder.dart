import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/features/home/presentation/bloc/home_bloc.dart';
import 'package:recipely/features/home/presentation/widgets/recipe_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipesBuilder extends StatefulWidget {
  const RecipesBuilder({super.key});

  @override
  State<RecipesBuilder> createState() => _RecipesBuilderState();
}

class _RecipesBuilderState extends State<RecipesBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return Skeletonizer.sliver(
              enabled: true,
              child: SliverList.separated(
                itemCount: 7,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 4,
                ),
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  color: Colors.grey[300],
                  child: const SizedBox(
                    height: 180,
                    width: double.infinity,
                  ),
                ),
              ),
            );
          case Status.success:
            return SliverList.separated(
                itemCount: state.recipes.length,
                itemBuilder: (context, index) =>
                    RecipeItem(recipe: state.recipes[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 4,
                    ));
          case Status.error:
            return SliverToBoxAdapter(
                child: Center(child: Text(state.errorMessage)));
        }
      },
    );
  }
}
