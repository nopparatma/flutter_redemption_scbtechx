import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/models/user_data_rs.dart';

import 'base_service.dart';

class RedemptionService extends BaseService {
  var mainUrl = 'https://run.mocky.io/v3';

  Future<UserDataRs> getUserData() async {
    return await get(
      '$mainUrl/2a87996e-2986-42d7-9d11-4c41b020bfe8',
      (data) => UserDataRs.fromJson(data),
    );
  }

  Future<ProductDataRs> getProductData() async {
    return await get(
      '$mainUrl/c7d61348-c6e0-4569-8321-11e58688d695',
      (data) => ProductDataRs.fromJson(data),
    );
  }
}
