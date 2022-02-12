part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedInSuccessfully extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotLoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedInFailed extends AuthState {
  final String error;

  LoggedInFailed(this.error);
  @override
  List<Object?> get props => [error];
}

class RegisteredSuccessfully extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotRegistered extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisteredFailed extends AuthState {
  final String error;

  RegisteredFailed(this.error);
  @override
  List<Object?> get props => [error];
}
