import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(LayoutInitial());

  int bottomNavIndex = 0;
  void changeBottomNav({required int index}) {
    bottomNavIndex = index;
    emit(ChangeBottomNav(index: index));
  }
}
