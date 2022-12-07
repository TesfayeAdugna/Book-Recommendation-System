import 'package:flutter/material.dart';
import 'features/features.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
      case SignUpPage.route:
        return MaterialPageRoute(builder: (context) {
          return const SignUpPage();
        });
    }
    return null;
  }
}