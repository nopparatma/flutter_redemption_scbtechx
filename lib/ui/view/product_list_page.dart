import 'package:flutter/material.dart';
import 'package:flutter_redemtion_scbtechx/services/redemption_service.dart';

import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Name'),
            Text('x,xxx Point'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RedemptionService redemptionService = RedemptionService();

          UserDataRs userDataRs = await redemptionService.getUserData();
          print(userDataRs);

          ProductDataRs productDataRs = await redemptionService.getProductData();
          print(productDataRs);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
