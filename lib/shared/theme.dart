import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_application/shared/colors.dart';

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(primary: mainColor),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: textColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
    ),
    iconTheme: IconThemeData(
      color: borderColor,
      size: 25.sp,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  // fontFamily: lang == 'en' ? 'Lexend' : 'Tajawal',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: mainColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: mainColor,
    unselectedItemColor: Colors.black45,
    selectedIconTheme: IconThemeData(size: 24.sp),
    selectedLabelStyle: TextStyle(
      // fontFamily: lang == 'en' ? 'Lexend' : "Tajawal",
      // fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      // fontFamily: lang == 'en' ? 'Lexend' : "Tajawal",
    ),
  ),
);
