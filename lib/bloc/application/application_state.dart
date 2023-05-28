part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final UserSessionDto? userSession;
  final List<Product>? masterProducts;

  const ApplicationState({this.userSession, this.masterProducts});

  ApplicationState copyWith({UserSessionDto? userSession, List<Product>? masterProducts}) {
    return ApplicationState(userSession: userSession ?? this.userSession, masterProducts: masterProducts ?? this.masterProducts);
  }

  @override
  String toString() {
    return 'ApplicationState{userSession: $userSession, masterProducts: $masterProducts}';
  }

  @override
  List<Object?> get props => [userSession, masterProducts];

  num remainPointAmt() {
    return MathUtil.subtract((userSession?.userDataRs?.customerData?.pointAmount ?? 0), (userSession?.useRedemptionAmt ?? 0));
  }

  num tempRemainPointAmt(num useAmt) {
    return MathUtil.subtract(remainPointAmt(), useAmt);
  }

  num calPointUsed(num productPrice, num rateBathPerPoint) {
    num sum = productPrice / rateBathPerPoint;
    return num.parse(sum.toStringAsFixed(2));
  }

  bool isFavoriteProduct(Product currentItem) {
    return userSession?.favoriteProducts?.contains(currentItem) ?? false;
  }
}
