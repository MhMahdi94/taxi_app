abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthSignUpLoadingState extends AuthStates {}

class AuthSignUpSuccessState extends AuthStates {}

class AuthSignUpFailureState extends AuthStates {
  final String? error;

  AuthSignUpFailureState(this.error);
}
