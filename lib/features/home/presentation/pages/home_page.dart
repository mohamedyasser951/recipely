import 'package:flutter/material.dart';
import 'package:recipely/features/home/presentation/widgets/category_item.dart';
import 'package:recipely/features/home/presentation/widgets/home_header.dart';
import 'package:recipely/features/home/presentation/widgets/recipes_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
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
