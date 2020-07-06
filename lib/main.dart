import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:chillyflix/Pages/splash_screen.dart';


void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  return runApp(MyApp()); 
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Shortcuts(
      // needed for AndroidTV to be able to select
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.select): const Intent(ActivateAction.key)},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Norway Voice Tv',
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
          primarySwatch: Colors.blueGrey,
          backgroundColor: Color.fromARGB(255, 35, 40, 50)
        ),
        home: SplashScreen(),
      ),
    );
  }
}