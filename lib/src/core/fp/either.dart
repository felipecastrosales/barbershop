sealed class Either<E extends Exception, S> {}

class Failure<E extends Exception, S> extends Either<E, S> {
  Failure(this.exception);
  final E exception;
}

class Success<E extends Exception, S> extends Either<E, S> {
  Success(this.value);
  final S value;
}
