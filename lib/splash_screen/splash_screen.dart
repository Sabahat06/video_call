import 'dart:async';
import 'package:_sabahat_repo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/bouncing_entrances/bounce_in_up.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: BounceInUp(
            child: Container(
              width: 150,
              height: 150,
              child: Hero(
                tag: "hero",
                child: Image.asset("assets/logo.png")
              ),
            ),
          ),
        ),
      ),
    );
  }

  navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => HomePage());
  }
}
