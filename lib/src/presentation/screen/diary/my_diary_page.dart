import 'package:diary_app/src/presentation/provider/diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/widget/diary_card.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/see_all_button.dart';

class MyDiary extends ConsumerWidget {
  const MyDiary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryAsync = ref.watch(diaryProvider);

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                right: defaultMargin, left: defaultMargin, top: 80),
            decoration: BoxDecoration(
              color: secondaryColor,
            ),
            child: Column(
              children: [
                Container(
                  child: diaryAsync.when(
                      data: (diary) {
                        if (diary.isNotEmpty) {
                          return Column(
                            children: [
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                // padding: const EdgeInsets.only(top: 20),
                                shrinkWrap: true,
                                children: diary
                                    .take(3)
                                    .map((e) => Expanded(
                                          child: DiaryCard(
                                            title: e.title,
                                            content: e.content,
                                            createdAt: e.createdAt,
                                            id: e.id,
                                          ),
                                        ))
                                    .toList(),
                              ),
                              diary.length > 3
                                  ? const SeeAllButton()
                                  : diary.length == 1
                                      ? const SizedBox(
                                          height: 100,
                                        )
                                      : const SizedBox(),
                            ],
                          );
                        } else {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 220,
                                // color: primaryColor,
                                child: Image.asset(
                                  'assets/image_no_data.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            ],
                          );
                        }
                      },
                      error: (e, s) => Center(child: Text("$e")),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          )),
                ),
                SizedBox(height: defaultMargin),
              ],
            )),
      ),
    );
  }
}
