import 'dart:async';
import 'package:dotbook/consts/strings.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1;
      });
    });

    // Navigate
    Timer(
      Duration(seconds: 4),
      () => Get.offAndToNamed(AppRoutes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 3),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset(
                Assets.brand.dotbookLogo.path,
                width: size.width / 2,
                height: size.width / 2,
              ),

              const SizedBox(height: 30),

              Text(AppStrings.brandName, style: textTheme.headlineLarge),

              const SizedBox(height: 10),

              Text(
                AppStrings.brandSubText,
                style: textTheme.headlineSmall!.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
