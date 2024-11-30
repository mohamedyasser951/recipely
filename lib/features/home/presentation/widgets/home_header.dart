import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
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
          const Spacer(),
          const Icon(Icons.notifications_none)
        ],
      ),
    );
  }
}
