import 'package:diary_app/src/presentation/provider/states/main_nav/main_nav_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavNotifier extends StateNotifier<MainNavStates> {
  MainNavNotifier() : super(const MainNavStates());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final mainNavProvider = StateNotifierProvider<MainNavNotifier, MainNavStates>(
    (ref) => MainNavNotifier());
