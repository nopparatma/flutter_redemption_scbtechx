part of 'splash_load_bloc.dart';

@immutable
abstract class SplashLoadState {}

class InitialSplashLoadState extends SplashLoadState {}

class LoadingSplashLoadInitState extends SplashLoadState {}

class SuccessSplashLoadInitState extends SplashLoadState {}

