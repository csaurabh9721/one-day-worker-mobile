import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double? fontSize;
  final bool isNotGradient;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.fontSize,
    this.isNotGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: isNotGradient ? Theme.of(context).primaryColor : null,
        gradient: isNotGradient ? null : AppColors.backgroundGradient,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: GoogleFonts.inter(
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Row(
          children: [
            Text(text, textAlign: TextAlign.center),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
