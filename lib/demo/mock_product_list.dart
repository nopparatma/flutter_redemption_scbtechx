import 'dart:convert';

import '../models/product_data_rs.dart';

class MockProductList {
  ProductDataRs getAllProduct() {
    return ProductDataRs.fromJson(json.decode('''{
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
}
