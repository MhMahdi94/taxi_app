import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';

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
            image: AssetImage('assets/images/authbg.png'),
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
              height: 40.h,
            ),
            Image(image: AssetImage('assets/images/logo.png')),
            Spacer(),
            AppButton(
              label: 'SIGN IN',
              onTap: () {
                print('SIGN IN');
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextButton(
              label: 'SIGN UP',
              onTap: () {
                print('SIGN UP');
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
