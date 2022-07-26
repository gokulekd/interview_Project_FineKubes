import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_interview/constants/images.dart';
import 'package:project_interview/view/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset(splashLoading),
        ),
      )),
    );
  }
}

navigate(context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
}
