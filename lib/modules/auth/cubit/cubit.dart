import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_application/modules/auth/cubit/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  bool signUpLoading = false;
  Future<void> signUpWithEmailAndPwd(String email, String password) async {
    signUpLoading = true;
    emit(AuthSignUpLoadingState());

    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCredential = value;
      signUpLoading = false;
      emit(AuthSignUpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AuthSignUpFailureState(error.toString()));
    });

    print(userCredential);
  }
}
