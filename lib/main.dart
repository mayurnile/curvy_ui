import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );
    return MaterialApp(
      title: 'Curvy UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        canvasColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
          subtitle: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
          ),
          subhead: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          body1: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 18.0,
          ),
          display1: GoogleFonts.montserrat(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          button: GoogleFonts.montserrat(
            color: Colors.black.withOpacity(0.9),
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
