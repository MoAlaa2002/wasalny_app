import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/functions/snak_bar.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/core/widgets/custom_button.dart';
import 'package:wasalny_app/core/widgets/custom_radio.dart';
import 'package:wasalny_app/core/widgets/custom_text_form_filed.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_cubit.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_state.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/custom_phone_number_filed.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/custom_terms_and_conditions.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/show_password_icon.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();
    FocusNode focusNode = FocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is LoadedRegisterSate) {
              snackBar(msg: "Created Account Successfully.", context: context);
              context.goNamed(RoutesName.loginScreen);
            } else if (state is FailureRegisterSate) {
              snackBar(msg: state.errormsg, context: context);
            }
          },
          builder: (context, state) {
            return Form(
              key: read.keyRegister,
              child: Column(
                children: [
                  CustomAppBar(
                    header: 'Register',
                    title: 'Already have an account?',
                    subTitle: 'Login',
                    onTap: () => context.goNamed(RoutesName.loginScreen),
                  ),
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
                      controller: read.fullName,
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
                      right: 220.w,
                      top: 20.h,
                      bottom: 10.h,
                    ),
                    child: Text(
                      "Phone Number",
                      style: AppFont.text16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 327.w,
                    child: CustomPhoneNumberFiled(
                      controller: read.phoneNumber,
                      read: read.phoneNumber.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 260.w,
                      top: 10.h,
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
                      icon: ShowPasswordIcon(),
                      isHidden: !read.isShowPass,
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
                      controller: read.confirmPassword,

                      label: "Confirm Password",
                      icon: ShowPasswordIcon(),
                      isHidden: !read.isShowPass,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80.h),
                    child: Row(
                      children: [
                        Text(
                          "Driver",
                          style: AppFont.text16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),

                        CustomRadio(
                          value: 'driver',
                          groupValue: read.userType ?? '',
                          onChanged: (value) {
                            read.updateUserType(value!);
                          },
                        ),
                        SizedBox(width: 50.w),
                        Text(
                          "Rider",
                          style: AppFont.text16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),
                        CustomRadio(
                          value: 'rider',
                          groupValue: read.userType ?? '',
                          onChanged: (value) {
                            read.updateUserType(value!);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                      bottom: 30.h,
                    ),
                    child: CustomTermsAndConditions(),
                  ),
                  state is LoadingRegisterSate
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.grey,
                          ),
                        )
                      : CustomButton(
                          onTap: () {
                            if (read.value == true) {
                              read.registervalidate();
                              read.confirmPass();
                            }
                          },
                          height: 56.h,
                          width: 343.w,
                          gradient: LinearGradient(
                            colors: read.value == false
                                ? [AppColors.grey, Colors.white]
                                : [AppColors.black, AppColors.babyblue],
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
