import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';

class UserSessionDto {
  num useRedemptionAmt;
  UserDataRs? userDataRs;
  List<Product>? favoriteProducts;

  UserSessionDto({this.useRedemptionAmt = 0, this.userDataRs, this.favoriteProducts});
}
