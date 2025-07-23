import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/assets.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    splas();
  }

  splas() {
    Future.delayed(Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser != null) {
        context.goNamed(RoutesName.homeScreen);
      } else {
        context.goNamed(RoutesName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsApp.logo, height: 150.h, width: 150.w),
            SizedBox(height: 15.h),
            Text("Wasalny", style: AppFont.text30),
          ],
        ),
      ),
    );
  }
}
