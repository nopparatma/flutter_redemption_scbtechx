import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

class StringUtil {
  static String toStringFormat(num s, String format) {
    return NumberFormat(format).format(s);
  }

  static String getDisplayNumber(num value) {
    if (isInt(value.toString())) {
      return toStringFormat(value, '#,##0');
    } else {
      return toStringFormat(value, '#,##0.00');
    }
  }
}
