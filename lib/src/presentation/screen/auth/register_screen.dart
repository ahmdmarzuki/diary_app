import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password', hintStyle: GoogleFonts.poppins())),
            ),
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
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password Confirmation',
                      hintStyle: GoogleFonts.poppins())),
            ),
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
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: accentColor),
        child: Center(
            child: CostumText(
          text: "Register",
          color: whiteColor,
          fontSize: 18,
        )),
      ),
    );
  }

  Widget googleButton() {
    return InkWell(
      onTap: () {},
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
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 12),
                              height: 6,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                          SizedBox(height: defaultMargin),
                          CostumText(
                            text: "Welcome Back",
                            color: blackColor,
                            fontSize: 18,
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: blackColor.withOpacity(.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                        style: GoogleFonts.poppins(),
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'Email Address',
                                            hintStyle: GoogleFonts.poppins())),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: blackColor.withOpacity(.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                        style: GoogleFonts.poppins(),
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'password',
                                            hintStyle: GoogleFonts.poppins())),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: accentColor),
                              child: Center(
                                  child: CostumText(
                                text: "Login",
                                color: whiteColor,
                                fontSize: 18,
                              )),
                            ),
                          ),
                          SizedBox(height: 28),
                          Stack(children: [
                            const Divider(thickness: 2),
                            Center(
                              child: Container(
                                height: 20,
                                width: 40,
                                color: secondaryColor,
                                child: Center(
                                    child: CostumText(
                                        text: "or", color: blackColor)),
                              ),
                            )
                          ]),
                          SizedBox(height: 28),
                          Center(
                            child: Image.asset(
                              'assets/icon_google.png',
                              width: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: CostumText(text: "Login", color: accentColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CostumText(
              text: "Getting Started",
              color: whiteColor,
              fontSize: 28,
              fontWeight: light,
            ),
            SizedBox(height: 90),
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
    );
  }
}
