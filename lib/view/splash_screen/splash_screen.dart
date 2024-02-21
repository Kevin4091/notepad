import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notepad/view/splash_screen/note_screen/notescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NoteScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/notebook.jpeg"),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
