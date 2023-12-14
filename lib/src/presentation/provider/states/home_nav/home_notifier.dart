import 'package:diary_app/src/presentation/provider/states/home_nav/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNavNotifier extends StateNotifier<HomeNavStates> {
  HomeNavNotifier() : super(const HomeNavStates());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final homeNavProvider = StateNotifierProvider<HomeNavNotifier, HomeNavStates>(
    (ref) => HomeNavNotifier());
