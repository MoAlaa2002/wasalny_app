import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/functions/snak_bar.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/core/widgets/Custom_back_page.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/resetpassword/reset_pass_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/resetpassword/reset_pass_state.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<ResetPassCubit>();
    return Scaffold(
      body: BlocConsumer<ResetPassCubit, ResetPassState>(
        listener: (context, state) {
          if (state is LoadedResetPassState) {
            snackBar(
              msg: " Check Your Email To Reset Your Password",
              context: context,
            );
            context.goNamed(RoutesName.loginScreen);
          } else if (state is FailureResetPassState) {
            snackBar(msg: state.errormsg, context: context);
          }
        },
        builder: (BuildContext context, ResetPassState state) {
          return Form(
            key: read.emailkey,
            child: Column(
              children: [
                SizedBox(height: 52.h),
                CustomBackPage(
                  onTap: () => context.goNamed(RoutesName.loginScreen),
                ),
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
                    controller: read.email,
                    label: "Email",
                    icon: Icon(Icons.email),
                    isHidden: false,
                  ),
                ),
                SizedBox(height: 50.h),
                state is LoadingResetPassState
                    ? CircularProgressIndicator(color: AppColors.grey)
                    : CustomButton(
                        onTap: () {
                          read.restPassvalidate();
                        },
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
        },
      ),
    );
  }
}
