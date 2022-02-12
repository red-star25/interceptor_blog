import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interceptor_blog/data/repository/profile_repository.dart';
import 'package:interceptor_blog/model/User.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<ProfileFetchEvent>(_fetchCurrentUserProfile);
  }

  FutureOr<void> _fetchCurrentUserProfile(
      ProfileFetchEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());
      final userProfile = await profileRepository.getUserProfileDetails();
      emit(ProfileLoaded(userProfile: userProfile));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
