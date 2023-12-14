import 'package:diary_app/src/presentation/screen/component/loading_layer.dart';
import 'package:diary_app/src/presentation/provider/write_diary_provider.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteDiaryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(addDiaryModelProvider);
    return LoadingLayer(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SafeArea(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 50),
            child: Column(
              children: [
                // SizedBox(height: 30),
                TextFormField(
                  // controller: titleController,
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
                  // controller: contentController,
                  initialValue: model.content,
                  onChanged: (value) => model.content = value,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: InputDecoration.collapsed(
                    hintText: "Ada cerita apa hari ini :)",
                    hintStyle:
                        GoogleFonts.poppins(fontSize: 16, fontWeight: light),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: model.enabled?()async{
                    try {
                      await model.writeDiary();
                      Navigator.pop(context);
                    } catch (e) {
                      print(e.toString());
                    }
                  }:null,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: accentColor),
                    child: Center(
                        child: Stack(
                      children: [
                        CostumText(
                          text: "Save",
                          color: whiteColor,
                          fontSize: 18,
                        ),
                      ],
                    )),
                  ),
                )
              ],
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

  