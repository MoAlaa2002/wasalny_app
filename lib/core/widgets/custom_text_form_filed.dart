import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    this.isHidden,
    required this.label,
    required this.icon,
    this.controller,
  });
  bool? isHidden;
  final String label;
  final Widget icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHidden!,
      validator: (value) {
        if (value!.isEmpty) {
          return "This Filed Is Reqiured";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: AppColors.grey500,
        hintText: label,
        hintStyle: TextStyle(color: AppColors.grey500),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}
