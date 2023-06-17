import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/shared/colors.dart';

//App Button
class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = mainColor});
  final String? label;
  final void Function()? onTap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 320.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//App Text Button
class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.label, required this.onTap});
  final String? label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          label!,
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
    );
  }
}
