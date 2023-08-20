import 'package:flutter/material.dart';

enum LoginStateStatus {
  initial,
  error,
  admLogin,
  employeeLogin,
}

class LoginState {
  const LoginState({
    required this.status,
    this.errorMessage,
  });

  const LoginState.initial() : this(status: LoginStateStatus.initial);

  final LoginStateStatus status;
  final String? errorMessage;

  LoginState copyWith({
    LoginStateStatus? status,
    ValueGetter<String?>? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
