part of 'redemption_bloc.dart';

class RedemptionState extends Equatable {
  List<Product>? products;
  num useRedemptionAmt;

  RedemptionState({this.products = const <Product>[], this.useRedemptionAmt = 0});

  @override
  List<Object?> get props => [products, useRedemptionAmt];
}

class InitialRedemptionState extends RedemptionState {}

class LoadingRedemptionState extends RedemptionState {
  @override
  String toString() {
    return 'LoadingRedemptionState{}';
  }
}

class SuccessSortDataState extends RedemptionState {
  final List<Product>? products;

  SuccessSortDataState({this.products}) : super(products: products);

  @override
  String toString() {
    return 'SuccessSortDataState{products: $products}';
  }
}

class SuccessRedemptionPointState extends RedemptionState {
  final num useRedemptionAmt;

  SuccessRedemptionPointState({this.useRedemptionAmt = 0}) : super(useRedemptionAmt: useRedemptionAmt);

  @override
  String toString() {
    return 'SuccessRedemptionPointState{useRedemptionAmt: $useRedemptionAmt}';
  }
}
