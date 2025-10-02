import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_color.dart';

class Label extends StatelessWidget {
  final String _label;

  Label(this._label, {super.key}) {
    _gap = 6;
    _isRequired = false;
  }

  Label.required(this._label, {super.key}) {
    _gap = 6;
    _isRequired = true;
  }

  Label.zero(this._label, {super.key}) {
    _gap = 0.0;
    _isRequired = false;
  }

  late final double _gap;
  late final bool _isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _gap),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _label,
            style: GoogleFonts.inter(
              color: Colors.grey.shade800,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (_isRequired)
            Text(
              " *",
              style: const TextStyle(
                color: AppColors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
