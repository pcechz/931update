import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/widgets/onboarding/slider_layout_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: onBordingBody(),
      ),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
