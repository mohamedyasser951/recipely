import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:recipely/features/layout/presentation/widgets/bottom_navigation_bar.dart';
import 'package:recipely/features/recipe/presentation/bloc/home_bloc.dart';
import 'package:recipely/features/recipe/presentation/pages/home_page.dart';
import 'package:recipely/services/serviceLoactor/service_locator.dart';

class MainLayout extends StatelessWidget {
  static List<Widget> screens = [
    const HomePage(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
  ];
  const MainLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceLocator.sl<BottomNavCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              ServiceLocator.sl<HomeBloc>()..add(const GetAllRecipesByLimit()),
        ),
      ],
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          final index = context.read<BottomNavCubit>().bottomNavIndex;
          return SafeArea(
            
            child: Scaffold(
              body: screens[index],
              bottomNavigationBar: const BottomNavBar(),
            ),
          );
        },
      ),
    );
  }
}
