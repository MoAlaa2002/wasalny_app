import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_cubit.dart';

class RiderScreen extends StatelessWidget {
  const RiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            BlocProvider.of<LoginCubit>(context).logout();
            context.goNamed(RoutesName.loginScreen);
          },
          icon: Icon(Icons.login_outlined),
        ),
      ),
      body: Center(child: Text('Rider')),
    );
  }
}
