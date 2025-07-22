import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/app_bar_register.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarRegister(),
            Padding(
              padding: EdgeInsets.only(right: 270.w, top: 20.h, bottom: 10.h),
              child: Text(
                "Name",
                style: AppFont.text16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 327.w,
              child: CustomTextFormFiled(
                label: "Name",
                icon: Icon(Icons.person),
                isHidden: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 270.w, top: 20.h, bottom: 10.h),
              child: Text(
                "Email",
                style: AppFont.text16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 327.w,
              child: CustomTextFormFiled(
                label: "Email",
                icon: Icon(Icons.email),
                isHidden: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 260.w, top: 20.h, bottom: 10.h),
              child: Text(
                "Password",
                style: AppFont.text16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 327.w,
              child: CustomTextFormFiled(
                label: "Password",
                icon: Icon(Icons.remove_red_eye),
                isHidden: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 200.w, top: 20.h, bottom: 10.h),
              child: Text(
                "Confirm Password",
                style: AppFont.text16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 327.w,
              child: CustomTextFormFiled(
                label: "Confirm Password",
                icon: Icon(Icons.remove_red_eye),
                isHidden: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 30.h),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    "I have agree to our Terms and Condition",
                    style: AppFont.text12.copyWith(
                      color: AppColors.grey500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              height: 56.h,
              width: 343.w,
              gradient: LinearGradient(
                colors: [AppColors.black, AppColors.babyblue],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
              ),
              text: "Sign Up",
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
