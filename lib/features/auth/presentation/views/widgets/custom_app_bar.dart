import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
    required this.header,
  });
  final void Function()? onTap;
  final String title;
  final String subTitle;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 219.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.black, AppColors.babyblue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 200.w),
              child: Text(
                header,
                style: AppFont.text30.copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w),
              child: Row(
                children: [
                  Text(
                    title,
                    // "Already have an account?",
                    style: AppFont.text16.copyWith(color: AppColors.white),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: onTap,
                    child: Text(
                      subTitle,
                      // "Login",
                      style: AppFont.text16.copyWith(color: AppColors.grey300),
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
}
