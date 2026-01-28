import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFF151A21);
  static const Color card = Color(0xFFFFFFFF);

  static const Color primary = Color(0xFF4DA3FF);
  static const Color primarySoft = Color(0xFF1E3A5F);

  static const Color accent = Color(0xFF7C7CFF);
  static const Color mutedAccent = Color(0xFFE5E7EB );

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF9AA4B2);
  static const Color textMuted = Color(0xFF6B7280);

  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFF1F2530);

  static const Color success = Color(0xFF2ED573);
  static const Color warning = Color(0xFFFFC048);
  static const Color error = Color(0xFFFF6B6B);

  static const Color disabled = Color(0xFF3A3F47);
  static const Color overlay = Color(0x99000000);
}


class AppTextStyles {
  static final TextStyle text12 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text16Bold = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle text18 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text18Bold = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle title20 = GoogleFonts.poppins(
    fontSize: 20,
  );

  static final TextStyle title20Bold = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle title24 = GoogleFonts.poppins(
    fontSize: 24,
  );

  static final TextStyle title24Bold = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle title30 = GoogleFonts.poppins(
    fontSize: 30,
  );

  static final TextStyle title30Bold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
}

