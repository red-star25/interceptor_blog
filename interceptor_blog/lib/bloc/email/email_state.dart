part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailLoading extends EmailState {}

class EmailLoaded extends EmailState {
  final String email;
  const EmailLoaded({
    required this.email,
  });
}

class EmailError extends EmailState {
  final String error;
  const EmailError({
    required this.error,
  });
}
