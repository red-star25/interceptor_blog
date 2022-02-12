import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interceptor_blog/data/repository/email_repository.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository emailRepository;
  EmailBloc({required this.emailRepository}) : super(EmailInitial()) {
    on<FetchEmailEvent>(_fetchEmail);
  }

  FutureOr<void> _fetchEmail(
      FetchEmailEvent event, Emitter<EmailState> emit) async {
    try {
      emit(EmailLoading());
      final email = await emailRepository.getEmail(id: event.id);
      emit(EmailLoaded(email: email));
    } catch (e) {
      emit(EmailError(error: e.toString()));
    }
  }
}
