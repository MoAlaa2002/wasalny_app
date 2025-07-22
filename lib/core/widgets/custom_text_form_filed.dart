import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasalny_app/core/constants/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    this.isHidden,
    this.vaildate,
    required this.label,
    required this.icon,
  });
  bool? isHidden;
  final String? Function(String?)? vaildate;
  final String label;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden!,
      validator: vaildate,
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
