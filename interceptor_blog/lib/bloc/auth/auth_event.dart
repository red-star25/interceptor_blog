part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  LogInRequested(this.email, this.password);
  final String email;
  final String password;
}

class LogInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class ResigterRequested extends AuthEvent {
  ResigterRequested(this.email, this.password, this.userName);
  final String email;
  final String password;
  final String userName;
}

class LogOutRequested extends AuthEvent {}
