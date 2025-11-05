import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kinder_app/core/locator/get_it_instant.dart';
import 'package:kinder_app/core/repo/supabase/supabase_integration.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? emailSave;
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginMethod);
    on<SignUpEvent>(createMethod);
    on<RestPasswordEvent>(restMethod);
    on<OTPVerifyEvent>(otpVerifyMethod);
  }

  FutureOr<void> loginMethod(LoginEvent event, Emitter<AuthState> emit) async {
    final resultLogin = await InstantGetIt.supabase.login(email: event.email);

    resultLogin.when(
      (success) {
        emit(SuccessLoginState());
      },
      (error) {
        emit(ErrorState(msg: error.message));
      },
    );
  }

  FutureOr<void> createMethod(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());

    final resultSignup = await InstantGetIt.supabase.signUp(email: event.email);
    resultSignup.whenSuccess((success) {
      emailSave = event.email;
      emit(SuccessSignUpState());
    });

    resultSignup.whenError((error) {
      emit(ErrorState(msg: error.message));
    });
  }

  FutureOr<void> restMethod(RestPasswordEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> otpVerifyMethod(
    OTPVerifyEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());

    final resultSignup = await InstantGetIt.supabase.verifyOTP(
      email: "emailVerify"!,
      otp: event.otp,
    );
    resultSignup.whenSuccess((success) {
      emit(SuccessSignUpState());
    });

    resultSignup.whenError((error) {
      emit(ErrorState(msg: error.message));
    });
  }
}
