import 'package:equatable/equatable.dart';

class MainNavStates extends Equatable {
  final int index;

  const MainNavStates({this.index = 0});

  MainNavStates copyWith({int? index}) {
    return MainNavStates(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}
