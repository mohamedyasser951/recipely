import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/features/recipe/presentation/bloc/home_bloc.dart';
import 'package:recipely/features/recipe/presentation/widgets/category_item.dart';
import 'package:recipely/features/recipe/presentation/widgets/home_header.dart';
import 'package:recipely/features/recipe/presentation/widgets/recipes_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  final List<String> categories = [
    "🐔 Chicken",
    "🥩 Beef Meat",
    "🍤 Shrimp",
    "🐟 Fish ",
    "🥚 Egg ",
    "🥦 Broccoli",
    "🥒 Cucumber",
  ];
  @override
  void initState() {
    scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    double currentScroll = scrollController.offset;
    double maxScroll = scrollController.position.maxScrollExtent;
    if (currentScroll >= (maxScroll * 0.8)) {
      BlocProvider.of<HomeBloc>(context).add(const GetAllRecipesByLimit());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              const HomeHeader(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "What's in your fridge?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Wrap(
                    children: List.generate(
                  categories.length,
                  (index) => CategoryItem(text: categories[index]),
                )),
              ),
              const RecipesBuilder()
            ],
          ),
        ));
  }
}
