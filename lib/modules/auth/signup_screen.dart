import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taxi_application/modules/auth/otp_screen.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';
import 'package:taxi_application/shared/functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Enter mobile number',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              IntlPhoneField(
                controller: numberController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h)
                    //labelText: 'Phone Number',
                    // border: Border(
                    //   bottom: BorderSide.none,
                    //   top: BorderSide.none,
                    //   right: BorderSide.none,
                    //   left: BorderSide.none,
                    // ),
                    ),
                initialCountryCode: 'AE',
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Mobile Number is Required Field';
                  }
                  return null;
                },
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Text(
                  'By continuing, I confirm that i have read & agree to the Terms & conditions and Privacy policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: overlayColor,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              AppButton(
                label: 'CONTINUE',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // process charge
                    navigateTo(context, const OTP_screen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
