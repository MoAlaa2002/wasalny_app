import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:wasalny_app/core/constants/colors.dart';
import 'package:wasalny_app/core/constants/fonts.dart';
import 'package:wasalny_app/core/helpers/routing/routes_name.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_cubit.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.white,
      //   title: IconButton(
      //     onPressed: () {
      //       BlocProvider.of<LoginCubit>(context).logout();
      //       context.goNamed(RoutesName.loginScreen);
      //     },
      //     icon: Icon(Icons.login_outlined),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 30.h),
        child: SliderDrawer(
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              title: Text(
                "Driver Mode",
                textAlign: TextAlign.center,
                style: AppFont.text18.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          sliderOpenSize: 270,
          slider: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.0.h, bottom: 10.h),
                child: CircleAvatar(
                  backgroundColor: AppColors.grey,
                  radius: 50.r,
                  child: CircleAvatar(
                    radius: 45.r,
                    backgroundImage: AssetImage("assets/images/rider.jpg"),
                  ),
                ),
              ),
              Text(
                "Moalaa",
                style: AppFont.text20.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: AppColors.grey500,
                  thickness: 2.r,
                  radius: BorderRadius.circular(10.r),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_filled,
                  size: 40,
                  color: AppColors.grey,
                ),
                title: Center(
                  child: Text(
                    "Home",
                    style: AppFont.text20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: AppColors.grey500,
                  thickness: 2.r,
                  radius: BorderRadius.circular(10.r),
                ),
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<LoginCubit>(context).logout();
                  context.goNamed(RoutesName.loginScreen);
                },
                leading: Icon(Icons.logout, size: 40, color: AppColors.grey),
                title: Center(
                  child: Text(
                    "Logout",
                    style: AppFont.text20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: Container(color: Colors.amber),
        ),
      ),
    );
  }
}
