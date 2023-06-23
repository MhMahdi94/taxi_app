import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';

class OTP_screen extends StatelessWidget {
  const OTP_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      margin: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: mainColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Text(
              'OTP  Verification',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 25.sp,
                color: textColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Enter the 4-digit code sent to you at',
              style: TextStyle(
                fontSize: 16.sp,
                color: overlayColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  '+91 98765 43210',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            AppButton(
              label: 'SUBMIT',
              onTap: () {
                print('otp submit');
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: Text(
                'Resend code in 02:59',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
