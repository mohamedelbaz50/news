import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        color: AppColors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
      )),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
