import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_shop/screens/nav_bar_screen.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      home: const BottomNavBar(),
    );
  }
}
