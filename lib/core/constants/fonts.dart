import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasalny_app/core/constants/colors.dart';

abstract class AppFont {
  static TextStyle text12 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
  );
  static TextStyle text14 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
  );
  static TextStyle text16 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
  );
  static TextStyle text18 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: 18.sp,
  );
  static TextStyle text20 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    fontSize: 20.sp,
  );
  static TextStyle text22 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
  );
  static TextStyle text30 = GoogleFonts.urbanist(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
  );
}
