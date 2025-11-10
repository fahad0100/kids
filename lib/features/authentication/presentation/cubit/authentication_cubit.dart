import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kinder_app/features/authentication/domain/usecases/auth_use_case.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late final AuthUseCase _authUseCase;
  AuthenticationCubit({required AuthUseCase authUseCase})
    : super(AuthenticationInitial()) {
    _authUseCase = authUseCase;
  }

  Future createAccount({
    required String name,
    required String email,
    required String type,
  }) async {
    await _authUseCase.createAccount(name: name, email: email, type: type);
  }
}
