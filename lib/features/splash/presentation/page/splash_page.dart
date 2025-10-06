import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_day_worker/core/routes/route_names.dart';
import 'package:one_day_worker/core/theme/app_color.dart';

import '../../../../shared/images/png_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _pageRoute();
    super.initState();
  }

  void _pageRoute() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushNamed(context, RouteNames.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
          image: DecorationImage(
            image: AssetImage(PngImages.splashScreen),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "v-1.0.0",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Design & Developed By",
              style: GoogleFonts.jacquesFrancois(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "www.saurabh-chauhan.com",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
