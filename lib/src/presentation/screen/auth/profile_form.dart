import 'package:diary_app/src/core/services/auth_service.dart';
import 'package:diary_app/src/presentation/screen/main/main_nav.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final email = FirebaseAuth.instance.currentUser!.email!;
  final AuthService authService = AuthService();

  bool isMale = true;
  late String gender = isMale ? "Male" : "Female";

  bool isLoading = false;

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();

    super.dispose();
  }

  Future addUser() async {
    try {
      isLoading = true;

      await authService.addUsers(uid, email, firstNameController.text.trim(),
          lastNameController.text.trim(), gender);

      await authService.setDisplayName(firstNameController.text.trim());
    } catch (e) {
      print('Error at Profile form: ' + e.toString());
    }
  }

  Widget firstNameInput() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: blackColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration.collapsed(
                  hintText: 'First Name',
                  hintStyle: GoogleFonts.poppins(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastNameInput() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: blackColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: lastNameController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration.collapsed(
                  hintText: 'Last Name (Optional)',
                  hintStyle: GoogleFonts.poppins(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderInput() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isMale = true;
                gender = "male";
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: isMale
                      ? accentColor.withOpacity(.8)
                      : blackColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: CostumText(
                  text: "Male",
                  color: isMale ? whiteColor : blackColor.withOpacity(.5),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isMale = false;
                gender = "female";
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: !isMale
                    ? accentColor.withOpacity(.8)
                    : blackColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CostumText(
                  text: "Female",
                  color: !isMale ? whiteColor : blackColor.withOpacity(.5),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget addUserButton() {
    return InkWell(
      onTap: () {
        if (firstNameController.text != "") {
          addUser();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainNav()),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: CostumText(
                text: "Fill Correctly",
                color: whiteColor,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isLoading ? accentDarkColor : accentColor),
        child: Center(
            child: Stack(
          children: [
            CostumText(
              text: "Lanjut !!!",
              color: whiteColor,
              fontSize: 18,
            ),
            isLoading ? const CircularProgressIndicator() : const SizedBox()
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostumText(
                text: "Isi Profile",
                color: blackColor,
                fontSize: 28,
                fontWeight: light,
              ),
              const SizedBox(height: 60),
              firstNameInput(),
              const SizedBox(height: 20),
              lastNameInput(),
              const SizedBox(height: 20),
              genderInput(),
              const SizedBox(height: 60),
              addUserButton()
            ],
          ),
        ));
  }
}
