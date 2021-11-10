import 'dart:async';

import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/auth/AppSplashScreen.dart';
import 'package:creditswitch/view/screens/home_screen.dart';
import 'package:creditswitch/view/screens/auth/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => HomeScreen().launch(context));
    return MaterialApp(title: '', home: AppSplashScreen());
  }
}
