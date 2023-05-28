part of 'redemption_bloc.dart';

@immutable
abstract class RedemptionState {}

class InitialRedemptionState extends RedemptionState {}

class LoadingRedemptionState extends RedemptionState {
  @override
  String toString() {
    return 'LoadingRedemptionState{}';
  }
}

class SuccessSortDataState extends RedemptionState {
  final List<Product>? products;

  SuccessSortDataState({this.products});

  @override
  String toString() {
    return 'SuccessSortDataState{products: $products}';
  }
}

class SuccessRedemptionPointState extends RedemptionState {}
