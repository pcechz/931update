import 'dart:async';
import 'dart:convert';

import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/Home_base.dart';
import 'package:creditswitch/view/screens/Statistics.dart';
import 'package:creditswitch/view/screens/Transaction.dart';
import 'package:creditswitch/view/screens/auth/PassCodeScreen.dart';
import 'package:creditswitch/view/screens/auth/ReturnLoginScreen.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/home_screen.dart';
import 'package:creditswitch/view/screens/auth/landing_page.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

class AppSplashScreen extends StatefulWidget {
  static String tag = '/AppSplashScreen';

  @override
  AppSplashScreenState createState() => AppSplashScreenState();
}

class AppSplashScreenState extends State<AppSplashScreen> {
  bool onboarding = false;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));
    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;
    finish(context);

    loginStatus();
  }

  loginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int initScreen = prefs.getInt("initScreen");
    initScreen == 0 || initScreen == null
        ? onboarding = true
        : onboarding = false;
    if (onboarding) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LandingPage();
      }));
    } else {
      if (prefs.getString("token") == null) {
        ReturnLoginScreen().launch(context);
      } else {
        HomeBase().launch(context);
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeAnimation(
                          2.5,
                          Image.asset(
                            'assets/logo.png',
                            height: 235.0,
                            width: 235.0,
                            fit: BoxFit.cover,
                          ),
                          Curves.slowMiddle)
                    ]),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeAnimation(
                        2.5,
                        Image.asset(
                          'assets/copyright.png',
                          height: 48.0,
                          width: 182.0,
                          fit: BoxFit.cover,
                        ),
                        Curves.slowMiddle))
              ],
            )));
  }
}
