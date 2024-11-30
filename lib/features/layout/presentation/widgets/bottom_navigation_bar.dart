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
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        int index = context.read<BottomNavCubit>().bottomNavIndex;

        return BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
          currentIndex: index,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) =>
              context.read<BottomNavCubit>().changeBottomNav(index: index),
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  Assets.iconsHome,
                  color: index == 0 ? AppColors.primaryColor : null,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  Assets.iconsSearch,
                  color: index == 1 ? AppColors.primaryColor : null,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  Assets.iconsBookmark,
                  color: index == 2 ? AppColors.primaryColor : null,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  Assets.iconsProfile,
                  color: index == 3 ? AppColors.primaryColor : null,
                ))
          ],
        );
      },
    );
  }
}
