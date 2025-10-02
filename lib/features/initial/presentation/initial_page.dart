import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_day_worker/core/theme/app_color.dart';

import '../../../core/routes/route_names.dart';
import '../../../shared/components/primary_button.dart';
import '../../../shared/images/png_images.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset(
                PngImages.workerLogo,
                width: size.width - 80,
                height: size.width - 80,
              ),
            ),
            Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Find and book ",
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: "Trusted\nWorkers",
                    style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: " instantly",
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Your one-stop app to book skilled workers from technical to household services, get trusted help anytime, anywhere.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 40),
            PrimaryButton(
              width: 222,
              text: "Let's Get Started",
              onPressed: () => _onTapStart(context),
            ),
            SizedBox(height: 16, width: size.width),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account ? ",
                    style: GoogleFonts.inter(color: Colors.grey.shade800),
                  ),
                  TextSpan(
                    text: "Sign In",
                    recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
                    style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapStart(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.signUpPage);
  }

  void _onTapSignIn() {}
}
