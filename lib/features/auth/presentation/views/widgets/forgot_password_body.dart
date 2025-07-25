import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 52.h),
          CustomBackPage(),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 180.w),
            child: Text(
              "Forgot Password",
              style: AppFont.text18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Text(
              "Please enter your email to reset the password",
              style: AppFont.text14.copyWith(color: Colors.blueGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 220.w, top: 30.h),
            child: Text(
              "Enter Email",
              style: AppFont.text16.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 327.w,
            child: CustomTextFormFiled(
              label: "Email",
              icon: Icon(Icons.email),
              isHidden: false,
            ),
          ),
          SizedBox(height: 50.h),
          CustomButton(
            onTap: () {},
            height: 56.h,
            width: 343.w,
            text: 'Reset Password',
            gradient: LinearGradient(
              colors: [AppColors.black, AppColors.babyblue],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackPage extends StatelessWidget {
  const CustomBackPage({super.key});

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
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
    );
  }
}
