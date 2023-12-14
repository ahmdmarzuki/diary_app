import 'package:diary_app/src/core/model/diary_model.dart';
import 'package:diary_app/src/core/repository/diary_repository_provider.dart';
 import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';


final diaryProvider = StreamProvider<List<DiaryModel>>(
  (ref) => ref.read(diaryRepositoryProvider).diaryStream,
);