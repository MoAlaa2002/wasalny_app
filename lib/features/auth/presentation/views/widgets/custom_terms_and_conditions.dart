import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_cubit.dart';

class CustomTermsAndConditions extends StatefulWidget {
  const CustomTermsAndConditions({super.key});

  @override
  State<CustomTermsAndConditions> createState() =>
      _CustomTermsAndConditionsState();
}

class _CustomTermsAndConditionsState extends State<CustomTermsAndConditions> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
              BlocProvider.of<RegisterCubit>(
                context,
              ).updateTermsAndconditions(newValue);
            });
          },
        ),
        Text(
          "I have agree to our Terms and Condition",
          style: AppFont.text12.copyWith(
            color: AppColors.grey500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
