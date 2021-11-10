import 'dart:async';

import 'package:creditswitch/model/onboarding/slider.dart';
import 'package:creditswitch/utils/Constants.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/utils/onboarding/get_started_button.dart';
import 'package:creditswitch/view/animation/FadeAnimation.dart';
import 'package:creditswitch/view/screens/auth/NewUserSignup1.dart';
import 'package:creditswitch/view/screens/auth/NewUserSignup2.dart';
import 'package:creditswitch/view/screens/auth/ReturnLoginScreen.dart';
import 'package:creditswitch/view/widgets/onboarding/slide_dots.dart';
import 'package:creditswitch/view/widgets/onboarding/slide_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  bool isLast = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: sliderArrayList.length,
                  itemBuilder: (ctx, i) => SlideItem(i, sliderArrayList.length),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25.0,
                            top: MediaQuery.of(context).size.width * 0.12),
                        child: new GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setInt("initScreen", 1);
                            ReturnLoginScreen().launch(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FAAuth()));
                          },
                          child: Text(
                            Constants.SKIP,
                            style: TextStyle(
                              fontFamily: Constants.Avenir,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              color: fa_color_secondary,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                        1.6,
                        Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: MaterialButton(
                            minWidth: 309,
                            height: 54,
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt("initScreen", 1);
                              ReturnLoginScreen().launch(context);
                            },
                            color: fa_color_secondary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Curves.easeIn),
                    SizedBox(height: 5),
                    FadeAnimation(
                        1.6,
                        Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border(
                                bottom: BorderSide(color: fa_color_primary),
                                top: BorderSide(color: fa_color_primary),
                                left: BorderSide(color: fa_color_primary),
                                right: BorderSide(color: fa_color_primary),
                              )),
                          child: MaterialButton(
                            minWidth: 309,
                            height: 54,
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt("initScreen", 1);
                              NewUserSignup2().launch(context);
                            },
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: fa_color_primary),
                            ),
                          ),
                        ),
                        Curves.easeIn),
                  ],
                ))
              ],
            )),
      );
}
