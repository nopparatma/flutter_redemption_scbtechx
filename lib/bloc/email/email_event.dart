part of 'email_bloc.dart';

@immutable
abstract class EmailEvent {}

class SendEmailEvent extends EmailEvent {
  final Product productItem;

  SendEmailEvent({required this.productItem});
}
