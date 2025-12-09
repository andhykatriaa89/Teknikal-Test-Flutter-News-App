import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.login);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'RAGDANews',
          style: GoogleFonts.archivoBlack(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(83, 157, 243, 1),
          ),
        ),
      ),
    );
  }
}