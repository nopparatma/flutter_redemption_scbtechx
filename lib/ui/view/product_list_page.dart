import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redemption_scbtechx/services/redemption_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';
import '../router.dart';
import '../widget/custom_dropdown_button.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late UserDataRs userDataRs;
  late ProductDataRs productDataRs;

  final List<String> items = [
    'Sort : Price',
    'Sort : Rate',
  ];

  String? selectedValue;

  @override
  void initState() {
    super.initState();

    productDataRs = ProductDataRs.fromJson(json.decode('''{
   "product":[
      {
         "name":"MacBook",
         "description":"MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products. As of 2013, there are two types of MacBook computers: the base-level MacBook Air and the upper-level MacBook Pro.",
         "image":"https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/HA244?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1670455592623",
         "price":40000,
         "rateBahtPerPoint":4,
         "stock":3
      },
      {
         "name":"iPhone",
         "description":"The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera, and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system, and in 2021 when the iPhone 13 was introduced, it offered up to 1 TB of storage and a 12-megapixel camera.",
         "image":"https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-14-pro-max-colors.png",
         "price":35000,
         "rateBahtPerPoint":5,
         "stock":0
      },
      {
         "name":"Philips 3000 Series Air Fryer",
         "description":"Philips 3000 Series Air Fryer Essential Compact with Rapid Air Technology, 13-in-1 Cooking Functions to Fry, Bake, Grill, Roast & Reheat with up to 90% Less Fat*, Black, 4.1L capacity, (HD9252/91)",
         "price":3200,
         "rateBahtPerPoint":8,
         "stock":2
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6.5,
         "stock":3
      },
      {
         "name":"MacBook",
         "description":"MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products. As of 2013, there are two types of MacBook computers: the base-level MacBook Air and the upper-level MacBook Pro.",
         "image":"https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/HA244?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1670455592623",
         "price":40000,
         "rateBahtPerPoint":4,
         "stock":0
      },
      {
         "name":"iPhone",
         "description":"The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera, and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system, and in 2021 when the iPhone 13 was introduced, it offered up to 1 TB of storage and a 12-megapixel camera.",
         "image":"https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-14-pro-max-colors.png",
         "price":35000,
         "rateBahtPerPoint":5,
         "stock":5
      },
      {
         "name":"Philips 3000 Series Air Fryer",
         "description":"Philips 3000 Series Air Fryer Essential Compact with Rapid Air Technology, 13-in-1 Cooking Functions to Fry, Bake, Grill, Roast & Reheat with up to 90% Less Fat*, Black, 4.1L capacity, (HD9252/91)",
         "image":"https://m.media-amazon.com/images/I/515mBP-G16L._AC_SY300_SX300_.jpg",
         "price":3200,
         "rateBahtPerPoint":8.5,
         "stock":8
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      },
      {
         "name":"XIAOMI Smart Air Purifier 4 Lite (34964)",
         "description":"All-day protection for those who suffer from rhinitis and allergies. Xiaomi Smart Air Purifier 4 protects your respiratory health by keeping the air in your home clean and safe to breathe.",
         "image":"https://i01.appmifile.com/webfile/globalimg/products/m/xiaomi-smart-air-purifier-4-pro/section11Img.png",
         "price":2850,
         "rateBahtPerPoint":6,
         "stock":0
      }
   ]
}'''));
  }

  @override
  dispose() {
    super.dispose();
  }

  // test() async {
  //   RedemptionService redemptionService = RedemptionService();
  //
  //   UserDataRs userDataRs = await redemptionService.getUserData();
  //   print(userDataRs);
  //
  //   ProductDataRs productDataRs = await redemptionService.getProductData();
  //   print(productDataRs);
  // }

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropdownButton(
                  hint: 'Sort',
                  dropdownItems: items,
                  value: selectedValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    children: productDataRs.product?.map((e) => _buildProductItem(e)).toList() ?? [],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(Product productItem) {
    return Card(
      elevation: 5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoutePaths.productDetailPage, arguments: {'productItem': productItem});
        },
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(0),
          shadowColor: Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              alignment: Alignment.center,
              imageUrl: '${productItem.image}',
              fit: BoxFit.contain,
              height: 100,
              errorWidget: (context, url, error) {
                return Container(color: Colors.grey);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    productItem.name ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Text(productItem.price?.toString() ?? '', style: const TextStyle(color: Colors.black)),
            Text(productItem.rateBahtPerPoint?.toString() ?? '', style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
