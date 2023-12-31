import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taxi_application/shared/colors.dart';

import '../../shared/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.startWidget});
  final Widget startWidget;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then(
      (value) => navigateToWithReplacement(context, widget.startWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: mainColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image(
              image: const AssetImage("assets/images/logo.png"),
              width: 100.w,
              height: 100.h,
            ),
            const Spacer(),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 30.sp,
              // controller: AnimationController(
              //     vsync: this, duration: const Duration(milliseconds: 1500)),
            ),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      ),
    );
  }
}
