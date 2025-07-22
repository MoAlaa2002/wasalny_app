import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    this.color,
    required this.text,
    this.onTap,
    this.gradient,
  });
  final double height;
  final double width;
  final Color? color;
  final String text;
  final void Function()? onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            text,
            style: AppFont.text16.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
