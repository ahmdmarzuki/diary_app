import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HomeNavStates extends Equatable {

  final int index;

  const HomeNavStates({this.index=0});

  HomeNavStates copyWith({
    int? index
  }){
    return HomeNavStates(index: index?? this.index);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [index];
  
}