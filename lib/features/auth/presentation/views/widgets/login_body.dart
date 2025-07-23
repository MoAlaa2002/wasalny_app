import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/features/auth/presentation/views/widgets/custom_app_bar.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              header: 'Login',
              title: 'Do Not Have Account ?',
              subTitle: 'Register',
              onTap: () => context.goNamed(RoutesName.registerScreen),
            ),
          ],
        ),
      ),
    );
  }
}
