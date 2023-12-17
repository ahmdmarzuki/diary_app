// ignore_for_file: use_build_context_synchronously

import 'package:diary_app/src/core/services/auth_service.dart';
import 'package:diary_app/src/presentation/screen/auth/profile_form.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  bool isPassHide = true;
  bool isConfirmPassHide = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  // final AuthService authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordController.text.trim() ==
        passwordConfirmationController.text.trim()) {
      if (passwordController.text.trim().length > 7) {
        try {
          isLoading = true;
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ProfileForm()),
              (route) => false);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFF38ABBE),
              content: CostumText(
                text: "Register Success",
                color: whiteColor,
                textAlign: TextAlign.center,
              ),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: alertColor,
                content: CostumText(
                  text: "Email Already in Use",
                  color: whiteColor,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: CostumText(
              text: "Password must contain at least 8 letter",
              color: whiteColor,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: alertColor,
          content: CostumText(
            text: "Confirm your password correcly !",
            color: whiteColor,
            textAlign: TextAlign.center,
          ),
        ),
      );

      isLoading = false;
    }
  }

  Widget emailInput() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: emailController,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Email Address',
                      hintStyle: GoogleFonts.poppins())),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: passwordController,
                  obscureText: isPassHide ? true : false,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password', hintStyle: GoogleFonts.poppins())),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isPassHide = !isPassHide;
                });
              },
              child: SizedBox(
                height: 40,
                width: 18,
                child: isPassHide
                    ? Image.asset(
                        'assets/icon_eye_close.png',
                        width: 18,
                      )
                    : Image.asset(
                        'assets/icon_eye_open.png',
                        width: 18,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget confirmPasswordInput() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: passwordConfirmationController,
                  obscureText: isConfirmPassHide ? true : false,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password Confirmation',
                      hintStyle: GoogleFonts.poppins())),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isConfirmPassHide = !isConfirmPassHide;
                });
              },
              child: SizedBox(
                height: 40,
                width: 18,
                child: isConfirmPassHide
                    ? Image.asset(
                        'assets/icon_eye_close.png',
                        width: 18,
                      )
                    : Image.asset(
                        'assets/icon_eye_open.png',
                        width: 18,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Stack(children: [
      const Divider(thickness: 2),
      Center(
        child: Container(
          height: 20,
          width: 40,
          color: primaryColor,
          child: Center(child: CostumText(text: "or", color: whiteColor)),
        ),
      )
    ]);
  }

  Widget registerButton() {
    return InkWell(
      onTap: () {
        if (emailController.text != "" &&
            passwordController.text != "" &&
            passwordConfirmationController.text != "") {
          signUp();
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
              text: "Register",
              color: whiteColor,
              fontSize: 18,
            ),
            isLoading ? const CircularProgressIndicator() : const SizedBox()
          ],
        )),
      ),
    );
  }

  Widget googleButton() {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: secondaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CostumText(
              text: "Sign In with Google",
              color: blackColor,
              fontSize: 16,
              fontWeight: light,
            ),
            Image.asset(
              'assets/icon_google.png',
              width: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget alreadyHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CostumText(text: "Already have an account?", color: whiteColor),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: secondaryColor,
                  context: context,
                  builder: (context) {
                    return LoginScreen();
                  });
            },
            child: CostumText(text: "Login", color: accentColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumText(
                  text: "Getting Started",
                  color: whiteColor,
                  fontSize: 28,
                  fontWeight: light,
                ),
                const SizedBox(height: 90),
                emailInput(),
                const SizedBox(height: 16),
                passwordInput(),
                const SizedBox(height: 16),
                confirmPasswordInput(),
                const SizedBox(height: 50),
                alreadyHaveAnAccount(),
                const SizedBox(height: 12),
                registerButton(),
                const SizedBox(height: 28),
                divider(),
                const SizedBox(height: 28),
                googleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
