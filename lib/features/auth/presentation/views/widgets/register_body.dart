import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_state.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/app_bar_register.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is LoadedRegisterSate) {
              context.goNamed(RoutesName.loginScreen);
            } else if (state is FailureRegisterSate) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errormsg)));
            }
          },
          builder: (context, state) {
            return Form(
              key: read.keyRegister,
              child: Column(
                children: [
                  AppBarRegister(),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 270.w,
                      top: 20.h,
                      bottom: 10.h,
                    ),
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
                    padding: EdgeInsets.only(
                      right: 270.w,
                      top: 20.h,
                      bottom: 10.h,
                    ),
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
                      controller: read.email,
                      label: "Email",
                      icon: Icon(Icons.email),
                      isHidden: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 260.w,
                      top: 20.h,
                      bottom: 10.h,
                    ),
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
                      controller: read.password,

                      label: "Password",
                      icon: Icon(Icons.remove_red_eye),
                      isHidden: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 200.w,
                      top: 20.h,
                      bottom: 10.h,
                    ),
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
                      controller: read.conformPassword,

                      label: "Confirm Password",
                      icon: Icon(Icons.remove_red_eye),
                      isHidden: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                      bottom: 30.h,
                    ),
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
                    onTap: () {
                      read.registervalidate();
                      read.confirmPass();
                    },
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
            );
          },
        ),
      ),
    );
  }
}
