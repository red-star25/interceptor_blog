part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class FetchEmailEvent extends EmailEvent {
  final String id;
  const FetchEmailEvent({
    required this.id,
  });
}
