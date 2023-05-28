part of 'splash_load_bloc.dart';

@immutable
abstract class SplashLoadState {}

class InitialSplashLoadState extends SplashLoadState {
  @override
  String toString() {
    return 'InitialSplashLoadState{}';
  }
}

class LoadingSplashLoadInitState extends SplashLoadState {
  @override
  String toString() {
    return 'LoadingSplashLoadInitState{}';
  }
}

class SuccessSplashLoadInitState extends SplashLoadState {
  @override
  String toString() {
    return 'SuccessSplashLoadInitState{}';
  }
}
