import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/functions/check_email_verification.dart';
import 'package:wasalny_app/core/functions/snak_bar.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_state.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/custom_app_bar.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<LoginCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoadedLoginState) {
              //   if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
              //     context.goNamed(RoutesName.homeScreen);
              //     snackBar(msg: "Welcome Back.", context: context);
              //   } else {
              //     snackBar(msg: "Please Verified Your Email", context: context);
              //   }
              // } else if (state is FailureLoginState) {
              //   snackBar(msg: state.errormsg, context: context);
              bool isVerified = await checkEmailVerification(context);

              if (isVerified) {
                snackBar(msg: "Welcome Back.", context: context);
                Future.microtask(() {
                  context.goNamed(RoutesName.homeScreen);
                });
              } else {
                snackBar(msg: "Please verify your email.", context: context);
              }
            } else if (state is FailureLoginState) {
              snackBar(msg: state.errormsg, context: context);
            }
          },
          builder: (context, state) {
            return Form(
              key: read.loginKey,
              child: Column(
                children: [
                  CustomAppBar(
                    header: 'Login',
                    title: 'Do Not Have Account ?',
                    subTitle: 'Register',
                    onTap: () => context.goNamed(RoutesName.registerScreen),
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
                      right: 250.w,
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
                      icon: Icon(Icons.visibility_sharp),
                      isHidden: true,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  state is LoadingLoginState
                      ? CircularProgressIndicator(color: AppColors.grey)
                      : CustomButton(
                          onTap: () {
                            read.loginValidate();
                          },
                          height: 56.h,
                          width: 343.w,
                          text: 'LogIn',
                          gradient: LinearGradient(
                            colors: [AppColors.black, AppColors.babyblue],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
