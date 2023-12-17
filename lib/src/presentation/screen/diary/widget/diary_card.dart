import 'dart:ffi';

import 'package:diary_app/src/core/model/diary_model.dart';
import 'package:diary_app/src/core/provider/write_diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/write_diary_screen.dart';
import 'package:diary_app/src/presentation/screen/main/main_nav.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DiaryCard extends ConsumerWidget {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  const DiaryCard({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateFormat('dd-MM-yyyy').format(createdAt);
    final model = ref.watch(writeDiaryModelProvider);
    final writer = ref.read(writeDiaryModelProvider);

    return GestureDetector(
      onTap: () async {
        writer.initial = DiaryModel(
            id: id, title: title, content: content, createdAt: createdAt);
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WriteDiaryScreen()));
        writer.clear();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumText(
                    text: title,
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: light,
                  ),
                  const SizedBox(height: 24),
                  CostumText(
                    text: content,
                    color: blackColor,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                backgroundColor: secondaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                content: Row(
                                  children: [
                                    CostumText(
                                      text: "Setting",
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: light,
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        writer.initial = DiaryModel(
                                            id: id,
                                            title: title,
                                            content: content,
                                            createdAt: createdAt);
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WriteDiaryScreen()));
                                        writer.clear();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: accentColor,
                                        child: Image.asset(
                                          'assets/icon_pen.png',
                                          width: 20,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            backgroundColor: secondaryColor,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: defaultMargin),
                                                height: 200,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 12),
                                                        height: 6,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: defaultMargin),
                                                    CostumText(
                                                      text: "Yakin mau hapus ?",
                                                      color: blackColor,
                                                      fontSize: 18,
                                                      fontWeight: light,
                                                    ),
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 50,
                                                            // width: double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: blackColor
                                                                  .withOpacity(
                                                                      .2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Center(
                                                              child: CostumText(
                                                                text: "Cancel",
                                                                color:
                                                                    whiteColor,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              model
                                                                  .deleteDiary();
                                                              Navigator.pushAndRemoveUntil(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const MainNav()),
                                                                  (route) =>
                                                                      false);
                                                            },
                                                            child: Container(
                                                              height: 50,
                                                              // width: double.infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    alertColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    CostumText(
                                                                  text:
                                                                      "Delete",
                                                                  color:
                                                                      whiteColor,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: defaultMargin),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: alertColor,
                                        child: Image.asset(
                                          'assets/icon_trash.png',
                                          width: 20,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          });
                    },
                    child: const Icon(Icons.more_horiz_rounded)),
                const SizedBox(height: 24),
                CostumText(text: date, color: blackColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
