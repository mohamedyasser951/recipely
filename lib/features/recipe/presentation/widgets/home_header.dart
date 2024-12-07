import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      leading: const CircleAvatar(
        radius: 30,
      ),
      actions: const [Icon(Icons.notifications_none)],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, 👋🏻",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Mohamed Yasser",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
