import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:recipely/features/layout/presentation/widgets/bottom_navigation_bar.dart';
import 'package:recipely/home_page.dart';

class MainLayout extends StatelessWidget {
  static const List<Widget> screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  const MainLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final index = context.read<BottomNavCubit>().bottomNavIndex;
        return Scaffold(
          appBar: AppBar(),
          body: screens[index],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
