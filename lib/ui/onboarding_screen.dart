import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/create_email_screen.dart';
import 'package:spotify_clone/ui/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "images/onboarding_background.png",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "World's Greatest Music Streaming Platform",
              style: TextStyle(
                fontFamily: "AB",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: MyColors.whiteColor,
              ),
            ),
            const Text(
              "All Totally for Free",
              style: TextStyle(
                fontFamily: "AEB",
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: MyColors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const _ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 49),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 228, 34, 186),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateEmailScreen(),
                ),
              );
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 16,
                height: 1.2, // اضافه کردن ارتفاع خط
                color: Color.fromARGB(255, 41, 41, 41),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 49),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              side: const BorderSide(
                width: 1,
                color: MyColors.lightGrey,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontFamily: "AB",
                fontSize: 16,
                height: 1.2, // اضافه کردن ارتفاع خط
                color: MyColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
