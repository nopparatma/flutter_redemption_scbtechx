import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';

class DialogUtil {
  static Future<void> showLoadingDialog(BuildContext context) async {
    try {
      context.loaderOverlay.show();
    } catch (error) {
      print(error);
    }
  }

  static Future<void> hideLoadingDialog(BuildContext context) async {
    try {
      context.loaderOverlay.hide();
    } catch (error) {
      print(error);
    }
  }
}
