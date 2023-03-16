part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {
  const ApplicationEvent();

  List<Object> get props => [];
}

class ApplicationUpdateStateModelEvent extends ApplicationEvent {
  final UserSessionDto? userSession;
  final List<Product>? masterProducts;

  const ApplicationUpdateStateModelEvent({
    this.userSession,
    this.masterProducts,
  });

  @override
  String toString() {
    return 'ApplicationUpdateStateModelEvent{userSession: $userSession, masterProducts: $masterProducts}';
  }
}
