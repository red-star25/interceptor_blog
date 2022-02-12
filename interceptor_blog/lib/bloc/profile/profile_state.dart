part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User userProfile;
  const ProfileLoaded({
    required this.userProfile,
  });
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError({
    required this.message,
  });
}
