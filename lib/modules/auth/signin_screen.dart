import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taxi_application/layout/appLayout.dart';
import 'package:taxi_application/modules/auth/cubit/cubit.dart';
import 'package:taxi_application/modules/auth/cubit/states.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';
import 'package:taxi_application/shared/functions.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSignInFailureState) {
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message: 'Invalid Credentials', //state.error!,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }

        if (state is AuthSignInSuccessState) {
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!!',
              message: 'Successful',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.success,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          navigateToWithReplacement(context, const AppLayout());
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
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
                    controller: emailController,
                    label: 'Email',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Email is Required Field';
                      }
                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value!);
                      print(emailValid);
                      if (!emailValid) {
                        return 'Email is invalid';
                      }
                      return null;
                    },
                    iconData: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  AppTextForm(
                    controller: pwdController,
                    label: 'Password',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Password is Required Field';
                      }
                      return null;
                    },
                    obsecureText: true,
                    iconData: Icons.password,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  authCubit.signInLoading
                      ? SpinKitChasingDots(
                          color: mainColor,
                          size: 30.sp,
                          // controller: AnimationController(
                          //     vsync: this, duration: const Duration(milliseconds: 1500)),
                        )
                      : AppButton(
                          label: 'SIGN IN',
                          onTap: () {
                            authCubit.signInWithEmailAndPassword(
                              emailController.text,
                              pwdController.text,
                            );
                          },
                        ),
                  SizedBox(
                    height: 16.h,
                  ),
                  authCubit.signInLoading
                      ? Center(
                          child: Text(
                            'Please Wait',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                        )
                      : AppTextButton(
                          label: 'FORGOT PASSWORD',
                          color: mainColor,
                          onTap: () {
                            authCubit.resetPassword(context);
                          },
                          fontSize: 12.sp,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
