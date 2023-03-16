import 'package:flutter/material.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_detail_page.dart';
import 'package:flutter_redemption_scbtechx/ui/view/product_list_page.dart';
import 'package:flutter_redemption_scbtechx/ui/view/redemption_page.dart';
import 'package:flutter_redemption_scbtechx/ui/view/success_page.dart';

class RoutePaths {
  static const String index = '/';
  static const String productListPage = '/product_list_page';
  static const String productDetailPage = '/product_detail_page';
  static const String redemptionPage = '/redemption_page';
  static const String successPage = '/success_page';
}

class MobileRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> arguments = Map<String, dynamic>.from(settings.arguments == null ? {} : settings.arguments as Map<String, dynamic>);

    switch (settings.name) {
      case RoutePaths.productListPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProductListPage(),
        );
      case RoutePaths.productDetailPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductDetailPage(productItem: arguments['productItem']),
        );
      case RoutePaths.redemptionPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RedemptionPage(productItem: arguments['productItem']),
        );
      case RoutePaths.successPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SuccessPage(productItem: arguments['productItem']),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
