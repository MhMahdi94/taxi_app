import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_application/modules/auth/cubit/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  //Signup Function
  bool signUpLoading = false;
  Future<void> signUpWithEmailAndPwd(String email, String password) async {
    signUpLoading = true;
    emit(AuthSignUpLoadingState());

    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCredential = value;
      print(value.user);
      signUpLoading = false;
      emit(AuthSignUpSuccessState());
    }).catchError((error) {
      signUpLoading = false;
      print(error.toString());
      emit(AuthSignUpFailureState(error.toString()));
    });

    print(userCredential);
  }

  //SignIn
  bool signInLoading = false;
  User? user;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    signInLoading = true;
    emit(AuthSignInLoadingState());

    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        signInLoading = false;
        user = value.user;
        print(user);
        emit(AuthSignInSuccessState());
      },
    ).catchError(
      (error) {
        signInLoading = false;
        print(error.toString());
        emit(AuthSignInFailureState(error.toString()));
      },
    );
  }

  Future<void> resetPassword(context) async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await firebaseAuth.sendPasswordResetEmail(email: email!);
        print('Password reset email is sent');
      } catch (e) {
        print('Error resetting');
      }
    }
  }
}
