import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_application/modules/auth/auth_page.dart';
import 'package:taxi_application/modules/map/map_screen.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/functions.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut().then((value) {
      //           navigateToWithReplacement(context, const AuthPage());
      //         }).catchError((error) {});
      //       },
      //       icon: const Icon(Icons.logout_outlined),
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          MapWidget(
            kGooglePlex: _kGooglePlex,
            controller: _controller,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 140.w,
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  '\$ 154.75',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  margin: EdgeInsets.only(top: 24.h, right: 4.w, bottom: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                Container(
                  width: 24.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'GO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: double.infinity,
                  height: 165.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'You\'re offline',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18.sp,
                        ),
                      ),
                      Divider(
                        color: greyColor,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: mainColor,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '95.0%',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Acceptance',
                                  style: TextStyle(
                                    color: overlayColor,
                                    fontSize: 16.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.stars,
                                  color: mainColor,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '4.75',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                    color: overlayColor,
                                    fontSize: 16.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.cancel_presentation,
                                  color: mainColor,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '2.0%',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'Cancellation',
                                  style: TextStyle(
                                    color: overlayColor,
                                    fontSize: 16.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
