import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';

class CustomBackPage extends StatelessWidget {
  CustomBackPage({super.key, this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 350.w),
      height: 35.h,
      width: 35.w,
      decoration: BoxDecoration(
        color: AppColors.customGrey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
    );
  }
}
