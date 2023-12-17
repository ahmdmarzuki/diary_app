import 'package:diary_app/src/core/provider/diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/widget/diary_card.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDiaryScreen extends ConsumerWidget {
  const AllDiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaryAsync = ref.watch(diaryProvider);

    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 87,
        title: CostumText(
          text: "My Diary",
          color: whiteColor,
          fontSize: 18,
          fontWeight: light,
        ),
      ),
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              SizedBox(height: defaultMargin),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: blackColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_search.png',
                      width: 26,
                      color: blackColor.withOpacity(.7),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration.collapsed(
                              hintText: "Search",
                              hintStyle: GoogleFonts.poppins(fontSize: 18),
                            ))),
                  ],
                ),
              ),
              SizedBox(height: defaultMargin),
              diaryAsync.when(
                data: (diary) {
                  return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: diary
                              .map((e) => DiaryCard(
                                    title: e.title,
                                    content: e.content,
                                    createdAt: e.createdAt,
                                    id: e.id,
                                  ))
                              .toList(),
                        );
                      
                },
                error: (e, s) => Center(child: Text("$e")),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
