import 'package:diary_app/src/presentation/provider/diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/widget/diary_card.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDiary extends ConsumerWidget {
  const MyDiary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryAsync = ref.watch(diaryProvider);
    return Container(
        padding:
            EdgeInsets.only(right: defaultMargin, left: defaultMargin, top: 80),
        decoration: BoxDecoration(
          color: secondaryColor,
        ),
        child: diaryAsync.when(
            data: (diary) => ListView(
                  children: diary.take(3)
                      .map((e) => DiaryCard(
                            title: e.title,
                            content: e.content,
                            createdAt: e.createdAt,
                            id: e.id,
                          ))
                      .toList(),
                ),
            error: (e, s) => Center(child: Text("$e")),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
