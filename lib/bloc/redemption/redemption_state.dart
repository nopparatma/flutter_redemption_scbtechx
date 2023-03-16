part of 'redemption_bloc.dart';

@immutable
abstract class RedemptionState {}

class InitialRedemptionState extends RedemptionState {}

class LoadingRedemptionState extends RedemptionState {}

class SuccessSortDataState extends RedemptionState {
  final List<Product>? products;

  SuccessSortDataState({this.products});
}

class SuccessRedemptionPointState extends RedemptionState {

}
