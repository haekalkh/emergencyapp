import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 130, 173),
      body: Center(
        child: Text(
          'Logo',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 245, 237, 237))),
        ),
      ),
    );
  }
}
