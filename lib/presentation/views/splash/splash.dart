import 'dart:async';

import 'package:country/presentation/resources/color_manager.dart';
import 'package:country/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Timer? _timer;
  // startDelay() {
  //   _timer = Timer(Duration(seconds: 3), callback);
  // }
  // callback() => Navigator.pushReplacementNamed(context, RouteManager.splash);
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startDelay();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _timer?.cancel();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkMode,
    );
  }
}
