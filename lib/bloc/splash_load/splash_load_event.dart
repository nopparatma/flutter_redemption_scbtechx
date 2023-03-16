part of 'splash_load_bloc.dart';

@immutable
abstract class SplashLoadEvent {}

class SplashLoadInitEvent extends SplashLoadEvent {
  @override
  String toString() {
    return 'SplashLoadInitEvent{}';
  }
}
