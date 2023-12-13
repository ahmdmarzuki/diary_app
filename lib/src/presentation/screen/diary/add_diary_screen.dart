import 'package:diary_app/src/data/services/diary_service.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDiaryScreen extends StatefulWidget {
  const AddDiaryScreen({super.key});

  @override
  State<AddDiaryScreen> createState() => _AddDiaryScreenState();
}

class _AddDiaryScreenState extends State<AddDiaryScreen> {
  final DiaryService diaryService = DiaryService();

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final date = DateTime(DateTime.now().day);

  Future addDiary()async{
    try {
      await diaryService.addDiary(titleController.text, contentController.text, date).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Color(0xFF38ABBE),
                    content: CostumText(
                      text: "Success add diary",
                      color: whiteColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ));
    } catch (e) {
      print(e);
    }

    Navigator.pop(context);
  }
  Widget saveButton() {
    return InkWell(
      onTap: () {
        addDiary();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: accentColor),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 50),
          child: Column(
            children: [
              // SizedBox(height: 30),
              TextField(
                controller: titleController,
                style: GoogleFonts.poppins(fontSize: 28),
                decoration: InputDecoration.collapsed(
                  hintText: "Title",
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 28, fontWeight: light),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: contentController,
                style: GoogleFonts.poppins(fontSize: 16),
                decoration: InputDecoration.collapsed(
                  hintText: "Ada cerita apa hari ini :)",
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 16, fontWeight: light),
                ),
              ),
              Spacer(),
              saveButton()
            ],
          ),
        ),
      ),
    );
  }
}
