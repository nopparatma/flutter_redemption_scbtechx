import 'package:flutter/material.dart';

extension CustomTextStyles on TextTheme {
  TextStyle get smaller => const TextStyle(
    fontSize: 12,
  );

  TextStyle get small => const TextStyle(
    fontSize: 14,
  );

  TextStyle get normal => const TextStyle(
    fontSize: 16,
  );

  TextStyle get xNormal => const TextStyle(
    fontSize: 18,
  );

  TextStyle get large => const TextStyle(
    fontSize: 20,
  );

  TextStyle get larger => const TextStyle(
    fontSize: 24,
  );

  TextStyle get xLarger => const TextStyle(
    fontSize: 30,
  );

  TextStyle get xxLarger => const TextStyle(
    fontSize: 36,
  );

}
