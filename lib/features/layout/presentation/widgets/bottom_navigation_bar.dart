import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipely/constants/assets.dart';
import 'package:recipely/constants/colors.dart';
import 'package:recipely/features/layout/presentation/cubit/layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
      currentIndex: context.read<BottomNavCubit>().bottomNavIndex,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) =>
          context.read<BottomNavCubit>().changeBottomNav(index: index),
      items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsHome)),
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsSearch)),
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsBookmark)),
        BottomNavigationBarItem(icon: SvgPicture.asset(Assets.iconsProfile))
      ],
    );
  }
}
