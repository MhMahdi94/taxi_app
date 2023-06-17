import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController numberController = TextEditingController();
    TextEditingController pwdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 8.h,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextForm(
                controller: numberController,
                label: 'Mobile No',
                validator: (value) {},
                iconData: Icons.phone_android,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextForm(
                controller: pwdController,
                label: 'Password',
                validator: (value) {},
                obsecureText: true,
                iconData: Icons.password,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppButton(
                label: 'SIGN IN',
                onTap: () {},
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextButton(
                label: 'FORGOT PASSWORD',
                color: mainColor,
                onTap: () {},
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
