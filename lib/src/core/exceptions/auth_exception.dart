sealed class AuthException implements Exception {
  const AuthException({required this.message});
  final String message;
}

final class AuthError extends AuthException {
  const AuthError({required super.message});
}

final class AuthUnauthorizedException extends AuthException {
  const AuthUnauthorizedException({super.message = ''});
}
