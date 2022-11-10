import 'package:flutter/material.dart';
import '../views/splash/splash.dart';

class RouteManager {
  static const String splash = "/";
}

class Routes {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch(settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return unDefined();
    }
  }
  static Route<dynamic> unDefined() => MaterialPageRoute(builder: (_) => const Scaffold());
}