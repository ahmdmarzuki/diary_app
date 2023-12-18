import 'package:diary_app/src/presentation/screen/auth/profile_form.dart';
import 'package:diary_app/src/presentation/screen/main/main_nav.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signUserIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(() => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainNav())));

      // // ignore: use_build_context_synchronously
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const MainNav(),
      //     ),
      //   );
      isLoading = false;

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Gk ada user');
      } else if (e.code == 'wrong-password') {
        print('password salah');
      }
    }

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MainNav()),
    //     (route) => false);
  }

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.grey, borderRadius: BorderRadius.circular(3)),
            ),
          ),
          SizedBox(height: defaultMargin),
          CostumText(
            text: "Welcome Back",
            color: blackColor,
            fontSize: 18,
          ),
          const SizedBox(height: 20),
          Container(
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
                        controller: emailController,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Email Address',
                            hintStyle: GoogleFonts.poppins())),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
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
                        controller: passwordController,
                        obscureText: true,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration.collapsed(
                            hintText: 'password',
                            hintStyle: GoogleFonts.poppins())),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              setState(() {
                isLoading = true;
              });

              signUserIn();

              // setState(() {
              //   if (emailController.text != "" ||
              //       passwordController.text != "") {
              //     isLoading = false;
              //   } else {
              //     isLoading = true;
              //   }
              // });

              // Navigator.pop(context);
              // Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const MainNav()),
              //       (route) => false);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isLoading ? accentDarkColor : accentColor),
              child: Stack(
                children: [
                  Center(
                      child: CostumText(
                    text: "Login",
                    color: whiteColor,
                    fontSize: 18,
                  )),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox()
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Stack(children: [
            const Divider(thickness: 2),
            Center(
              child: Container(
                height: 20,
                width: 40,
                color: secondaryColor,
                child: Center(child: CostumText(text: "or", color: blackColor)),
              ),
            )
          ]),
          const SizedBox(height: 28),
          Center(
            child: Image.asset(
              'assets/icon_google.png',
              width: 30,
            ),
          )
        ],
      ),
    );
  }
}
