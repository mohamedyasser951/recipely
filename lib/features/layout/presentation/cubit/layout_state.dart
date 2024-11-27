part of 'layout_cubit.dart';

abstract class BottomNavState {
  const BottomNavState();
}

class LayoutInitial extends BottomNavState {}

class ChangeBottomNav extends BottomNavState {
  final int index;

  ChangeBottomNav({required this.index});
}
