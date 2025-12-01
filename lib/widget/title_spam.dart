import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSpam extends StatelessWidget {
  const TitleSpam({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Spam Detector',
      style: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
