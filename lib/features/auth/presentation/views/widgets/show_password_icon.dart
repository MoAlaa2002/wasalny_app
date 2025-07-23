import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_cubit.dart';

class ShowPasswordIcon extends StatefulWidget {
  const ShowPasswordIcon({super.key});

  @override
  State<ShowPasswordIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowPasswordIcon> {
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPassword = !isPassword;
          BlocProvider.of<RegisterCubit>(context).showPassword();
        });
      },
      icon: isPassword
          ? Icon(Icons.visibility_sharp)
          : Icon(Icons.visibility_off_sharp),
    );
  }
}
