import 'package:flutter/material.dart';
import 'package:metaway_holdings/feature/authentication/presentation/pages/login_page.dart';
import 'package:metaway_holdings/router/app_pages.dart';

class AppPages {
  static Map<String, WidgetBuilder> getPages(BuildContext context) {
    return {
      AppRoutes.login: (context) => const LoginPage(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> args = {};
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
