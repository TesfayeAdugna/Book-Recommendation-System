part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupButtonClicked extends SignupEvent {
  final String email, password;
  SignupButtonClicked({
      required this.email,
      required this.password});
}