import 'package:diary_app/src/core/model/diary_model.dart';
import 'package:diary_app/src/presentation/provider/write_diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/write_diary_screen.dart';
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
    return GestureDetector(
      onTap: () async {
        final writer = ref.read(writeDiaryModelProvider);
        writer.initial = DiaryModel(
            id: id, title: title, content: content, createdAt: createdAt);
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WriteDiaryScreen()));
        writer.clear();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 100,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumText(
                    text: title,
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: light,
                  ),
                  CostumText(
                    text: content,
                    color: blackColor,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            CostumText(text: date, color: blackColor)
          ],
        ),
      ),
    );
  }
}
