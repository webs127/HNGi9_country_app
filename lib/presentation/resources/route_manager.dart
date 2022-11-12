import 'package:flutter/material.dart';
import '../views/main/main_view.dart';
import '../views/splash/splash.dart';

class RouteManager {
  static const String splash = "/";
  static const String main = "/main";
}

class Routes {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch(settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.main:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefined();
    }
  }
  static Route<dynamic> unDefined() => MaterialPageRoute(builder: (_) => const Scaffold());
}