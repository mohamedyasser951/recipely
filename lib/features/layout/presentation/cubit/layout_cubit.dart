import 'package:bloc/bloc.dart';
part 'layout_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(LayoutInitial());
  
  int bottomNavIndex = 0;
  void changeBottomNav({required int index}) {
    emit(ChangeBottomNav(index: index));
  }
}
