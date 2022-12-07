import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_recommendation_system/features/features.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  // final AuthRepository authRepository;

  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonClicked>((event, emit) async {
      emit(SigningUserUp());
      User user = User(
        email: event.email,
        password: event.password,
      );

      // try {
      //   await authRepository.signUp(user: user);
      //   emit(SignupSuccessful());
      // } catch (e) {
      //   emit(SignupFailed(error: e.toString()));
      // }
    });
  }
}