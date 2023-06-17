import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/modules/auth/signin_screen.dart';
import 'package:taxi_application/modules/auth/signup_screen.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';
import 'package:taxi_application/shared/functions.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/authbg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.h,
            ),
            const Image(image: AssetImage('assets/images/logo.png')),
            const Spacer(),
            AppButton(
              label: 'SIGN IN',
              onTap: () {
                navigateTo(context, const SignInScreen());
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextButton(
              label: 'SIGN UP',
              onTap: () {
                print('SIGN UP');
                navigateTo(context, const SignUpScreen());
              },
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
