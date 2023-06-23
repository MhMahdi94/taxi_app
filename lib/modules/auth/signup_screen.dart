import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taxi_application/modules/auth/cubit/cubit.dart';
import 'package:taxi_application/modules/auth/cubit/states.dart';
import 'package:taxi_application/modules/auth/otp_screen.dart';
import 'package:taxi_application/modules/auth/signin_screen.dart';
import 'package:taxi_application/shared/colors.dart';
import 'package:taxi_application/shared/components.dart';
import 'package:taxi_application/shared/functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSignUpFailureState) {
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message: state.error!,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }

        if (state is AuthSignUpSuccessState) {
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
          navigateTo(context, const SignInScreen());
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
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
                    'Enter Email & Password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // IntlPhoneField(
                  //   controller: numberController,
                  //   decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.symmetric(vertical: 16.h)
                  //       //labelText: 'Phone Number',
                  //       // border: Border(
                  //       //   bottom: BorderSide.none,
                  //       //   top: BorderSide.none,
                  //       //   right: BorderSide.none,
                  //       //   left: BorderSide.none,
                  //       // ),
                  //       ),
                  //   initialCountryCode: 'AE',
                  //   validator: (value) {
                  //     if (value.toString().isEmpty) {
                  //       return 'Mobile Number is Required Field';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (phone) {
                  //     print(phone.completeNumber);
                  //   },
                  // ),
                  AppTextForm(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
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
                      iconData: Icons.email_outlined),
                  SizedBox(
                    height: 8.h,
                  ),
                  AppTextForm(
                      controller: passwordController,
                      label: 'Password',
                      obsecureText: true,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Password is Required Field';
                        }
                        return null;
                      },
                      iconData: Icons.password_outlined),
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
                        //navigateTo(context, const OTP_screen());
                        print(emailController.text);
                        print(passwordController.text);
                        authCubit.signUpWithEmailAndPwd(
                            emailController.text, passwordController.text);
                      }
                    },
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
