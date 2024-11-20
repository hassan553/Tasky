import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void navigateToPage(String page, {Object? arguments}) =>
      Navigator.pushNamed(this, page, arguments: arguments);

  void navigateToAndReplacement(String page) =>
      Navigator.pushReplacementNamed(this, page);

  void navigateToAndRemoveUntil(String page) =>
      Navigator.pushNamedAndRemoveUntil(this, page, (route) => false);
  void pop() => Navigator.canPop(this);
}
