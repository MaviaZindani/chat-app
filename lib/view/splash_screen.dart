import 'package:flutter/material.dart';
import 'package:cheatapp/component.dart';
import 'package:cheatapp/local_assets.dart';
import 'package:cheatapp/controller/local_logic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalLogic localLogic = LocalLogic();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localLogic.navigateFromSplashScreen(context);
    // WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: c_lightPinkColor,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(img_PinkLogo)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(img_SplashFood),
              ),
            ],
          )),
    );
  }
}
