import 'package:diary_app/src/presentation/screen/component/loading_layer.dart';
import 'package:diary_app/src/presentation/provider/write_diary_provider.dart';
import 'package:diary_app/src/presentation/screen/main/main_nav.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteDiaryScreen extends ConsumerWidget {
  const WriteDiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(writeDiaryModelProvider);
    return LoadingLayer(
      child: Scaffold(
        backgroundColor: secondaryColor,
        bottomNavigationBar: Container(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                              vertical: defaultMargin),
                          decoration: BoxDecoration(color: secondaryColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CostumText(
                                text: "Yakin gak jadi nulis  T_T",
                                color: blackColor,
                                fontSize: 22,
                                fontWeight: light,
                              ),

                              const Spacer(),

                              // delete button
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: alertColor),
                                  child: Center(
                                      child: CostumText(
                                    text: "Hapus",
                                    color: whiteColor,
                                    fontSize: 18,
                                  )),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // cancel button
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: accentColor)),
                                  child: Center(
                                      child: CostumText(
                                    text: "Lanjut Nulis",
                                    color: blackColor,
                                    fontSize: 18,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: alertColor),
                  child: Center(
                      child: Image.asset(
                    'assets/icon_trash.png',
                    width: 26,
                    color: whiteColor,
                  )),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: model.enabled
                      ? () async {
                          try {
                            await model.writeDiary().whenComplete(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  dismissDirection: DismissDirection.up,
                                  backgroundColor: successColor,
                                  duration: const Duration(seconds: 1),
                                  content: CostumText(
                                    text: "Success Added",
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainNav()), (route) => false);
                            });
                            
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      : null,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: accentColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icon_save.png',
                          width: 30,
                          color: whiteColor,
                        ),
                        CostumText(
                          text: "Save",
                          color: whiteColor,
                          fontSize: 22,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 32)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 50),
              child: Column(
                children: [
                  // SizedBox(height: 30),
                  TextFormField(
                    maxLength: 20,
                    initialValue: model.title,
                    onChanged: (value) => model.title = value,
                    style: GoogleFonts.poppins(fontSize: 28),
                    decoration: InputDecoration.collapsed(
                      hintText: "Title",
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 28, fontWeight: light),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines: null,
                    inputFormatters: [LengthLimitingTextInputFormatter(1000)],
                    initialValue: model.content,
                    onChanged: (value) => model.content = value,
                    style: GoogleFonts.poppins(fontSize: 16),
                    decoration: InputDecoration.collapsed(
                      hintText: "Ada cerita apa hari ini :)",
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 16, fontWeight: light),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  // Future addDiary()async{
  //   try {
  //     await diaryService.addDiary(titleController.text, contentController.text, date).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   backgroundColor: successColor,
  //                   content: CostumText(
  //                     text: "Success add diary",
  //                     color: whiteColor,
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ));
  //   } catch (e) {
  //     print(e);
  //   }

  //   Navigator.pop(context);
  // }
  // Widget saveButton() {
  //   return InkWell(
  //     onTap: () {
  //       addDiary();
  //     },
  //     child: Container(
  //       height: 50,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(12), color: accentColor),
  //       child: Center(
  //           child: Stack(
  //         children: [
  //           CostumText(
  //             text: "Save",
  //             color: whiteColor,
  //             fontSize: 18,
  //           ),
  //         ],
  //       )),
  //     ),
  //   );
  // }

  