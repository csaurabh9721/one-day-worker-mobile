import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          textStyle: GoogleFonts.inter(
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.bold,
          ),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)
          ),
        ),
        child: Row(
          children: [
            Text(text, textAlign: TextAlign.center),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
