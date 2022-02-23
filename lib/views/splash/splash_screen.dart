import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:nimu_calc/views/cal_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenFirst extends StatefulWidget {
  const SplashScreenFirst({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreenFirst> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CalcPage()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff38B6FF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadedSlideAnimation(
              child: const Center(
                child: Image(
                  image:
                      AssetImage('images/ekush_calculator_by_nimusoftlabs.png'),
                  height: 250,
                  width: 250,
                ),
              ),
              beginOffset: const Offset(0.0, 5.0),
              endOffset: const Offset(0.0, 0.0),
            ),
          ],
        ));
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              _seen == false ? const SplashScreenFirst() : const CalcPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashScreenFirst()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Material();
  }
}
