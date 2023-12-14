
import 'package:diary_app/src/core/model/diary_model.dart';
import 'package:diary_app/src/core/repository/diary_repository_provider.dart';
import 'package:diary_app/src/presentation/provider/loading_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addDiaryModelProvider =
    ChangeNotifierProvider((ref) => WriteDiaryModelProvider(ref.read));

// ChangeNotifierProvider((ref) => AddDiaryModelProvider(ref.read));

class WriteDiaryModelProvider extends ChangeNotifier {
  //// final Reader _reader;
  // ignore: prefer_typing_uninitialized_variables
  final _reader;
  WriteDiaryModelProvider(this._reader);

  DiaryModel initial = DiaryModel.empty();

  bool get edit => initial.id.isNotEmpty;

  String? _title;
  String get title => _title ?? initial.title;
  set title(String title) {
    _title = title;
    notifyListeners();
  }

  String? _content;
  String get content => _content ?? initial.content;
  set content(String content) {
    _content = content;
    notifyListeners();
  }

  Loading get _loading => _reader(loadingProvider);

  bool get enabled => title.isNotEmpty && content.isNotEmpty;

  DiaryRepository get _diaryRepository => _reader(diaryRepositortProvider);

  Future<void> writeDiary() async {
    final updated = initial.copyWith(
      title: title,
      content: content,
    );
    _loading.start();
    try {
      await _diaryRepository.writeDiary(updated);
      _loading.end();
    } catch (e) {
      _loading.stop();
      return Future.error("Something error");
    }
  }
}
