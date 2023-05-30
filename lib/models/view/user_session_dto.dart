import 'package:equatable/equatable.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';

class UserSessionDto extends Equatable {
  num useRedemptionAmt;
  UserDataRs? userDataRs;
  List<Product>? favoriteProducts;

  UserSessionDto({this.useRedemptionAmt = 0, this.userDataRs, this.favoriteProducts});

  @override
  String toString() {
    return 'UserSessionDto{useRedemptionAmt: $useRedemptionAmt, userDataRs: $userDataRs, favoriteProducts: $favoriteProducts}';
  }

  @override
  List<Object?> get props => [useRedemptionAmt, userDataRs, favoriteProducts];
}
