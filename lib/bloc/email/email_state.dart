part of 'email_bloc.dart';

@immutable
abstract class EmailState {}

class InitialEmailState extends EmailState {}

class LoadingSendEmailState extends EmailState {}

class ErrorSendEmailState extends EmailState {}

class SuccessSendEmailState extends EmailState {}