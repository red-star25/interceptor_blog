part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<User> users;

  const HomeLoaded({required this.users});
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}

class HomeLoggedOut extends HomeState {}
